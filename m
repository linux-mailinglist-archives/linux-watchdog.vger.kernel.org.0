Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB0D2A9079
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 08:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgKFHhM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 02:37:12 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2364 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgKFHhM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 02:37:12 -0500
Received: from dggeme709-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CSBzf4Zbkz51hX;
        Fri,  6 Nov 2020 15:37:02 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 dggeme709-chm.china.huawei.com (10.1.199.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 6 Nov 2020 15:37:08 +0800
Received: from dggeme762-chm.china.huawei.com ([10.8.68.53]) by
 dggeme762-chm.china.huawei.com ([10.8.68.53]) with mapi id 15.01.1913.007;
 Fri, 6 Nov 2020 15:37:08 +0800
From:   "wangwensheng (C)" <wangwensheng4@huawei.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Xiangrui (Euler)" <rui.xiang@huawei.com>,
        "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>
Subject: Re: [PATCH -next v3 1/2] watchdog: Fix potential dereferencing of
 null pointer
Thread-Topic: [PATCH -next v3 1/2] watchdog: Fix potential dereferencing of
 null pointer
Thread-Index: AQHWs3CwBqSD3b7850ugh4qmoAri0A==
Date:   Fri, 6 Nov 2020 07:37:08 +0000
Message-ID: <4a85d0170a69430585fb89aba7490d9a@huawei.com>
References: <20201105123848.93735-1-wangwensheng4@huawei.com>
 <20201105142621.GB1389@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.77]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

在 2020/11/5 22:26, Guenter Roeck 写道:
> On Thu, Nov 05, 2020 at 12:38:47PM +0000, Wang Wensheng wrote:
>> A reboot notifier, which stops the WDT by calling the stop hook without
>> any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.
>>
>> Howerer we allow the WDT driver to omit the stop hook since commit
>> "d0684c8a93549" ("watchdog: Make stop function optional") and provide
>> a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
>> in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
>> control reboot policy"). Together that commits make user potential to
>> insert a watchdog driver that don't provide a stop hook but with the
>> stop_on_reboot parameter set, then dereferencing of null pointer occurs
>> on system reboot.
>>
>> Check the stop hook before registering the reboot notifier to fix the
>> issue.
>>
>> Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
>> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
>> ---
>>   drivers/watchdog/watchdog_core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
>> index 423844757812..945ab38b14b8 100644
>> --- a/drivers/watchdog/watchdog_core.c
>> +++ b/drivers/watchdog/watchdog_core.c
>> @@ -267,8 +267,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>>   	}
>>   
>>   	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>> +		if (!wdd->ops->stop) {
>> +			pr_err("watchdog%d: Cannot support stop_on_reboot\n",
>> +				wdd->id);
>> +			watchdog_dev_unregister(wdd);
>> +			ida_simple_remove(&watchdog_ida, id);
>> +			return -EINVAL;
>> +		}
> 
> The problem with this is that setting the "stop_on_reboot" module parameter
> would now prevent the watchdog from being loaded, which isn't really
> desirable and might go unnoticed. I think the initial check should be
> above, with the "Mandatory operations" check, and
> 	if (stop_on_reboot != -1) {
> should be extended to
> 	if (stop_on_reboot != -1 && wdd->ops->stop) {
> 
> or possibly more fancy:
> 
> 	if (stop_on_reboot != -1) {
> 		if (stop_on_reboot) {
> 			if (!wdd->ops->stop)
> 				pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
> 			else
> 				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> 		} else {
> 			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
> 		}
> 	}
> 
> Thanks,
> Guenter

Now the divergence is that should we stop the registering process and 
return error when the STOP_ON_REBOOT flag is set but the driver doesn't 
support it. The flag is set in two scenes.
Firstly,the driver that should provide the stop hook may set the flag 
staticlly, and it is a bug of the driver if it set the flag but without 
a stop hook. Then giving an error shall be more striking.
Secondly, the user can change the flag using module parameter. Is it 
reasonable to just ignore the STOP_ON_REBOOT flag and give a warning 
when the user truely want it? And under this circumstance a warning is 
easier to get unnoticed than an error.
I prefer to stop the registering process and return an error in those 
two scenes.

Thanks
> 
>>   
>> +		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>>   		ret = register_reboot_notifier(&wdd->reboot_nb);
>>   		if (ret) {
>>   			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
>> -- 
>> 2.25.0
>>
> 

