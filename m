Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9838221543F
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jul 2020 10:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgGFI4t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jul 2020 04:56:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47850 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728135AbgGFI4t (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jul 2020 04:56:49 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj99B5wJf_pVQAA--.131S3;
        Mon, 06 Jul 2020 16:56:34 +0800 (CST)
Subject: Re: [PATCH] watchdog: bcm_kona_wdt: Use correct return value for
 bcm_kona_wdt_probe()
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <1590391864-308-1-git-send-email-yangtiezhu@loongson.cn>
 <99e82049-2d99-9a8e-4023-96f585b47e30@roeck-us.net>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <19929e73-253b-7d29-b8f8-365266d88a5f@loongson.cn>
Date:   Mon, 6 Jul 2020 16:56:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <99e82049-2d99-9a8e-4023-96f585b47e30@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj99B5wJf_pVQAA--.131S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JFy8ArWrWw4kGF4UXr1DJrb_yoWDtwb_Ga
        12krZ3ury8Wr10vFn0yay5ZwsxtFn8uF1kXw1xKay3X347JryfArW09r1ftw43Ww4Yyrsx
        AFyDWw4a9rnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUsF4iUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 05/25/2020 09:47 PM, Guenter Roeck wrote:
> On 5/25/20 12:31 AM, Tiezhu Yang wrote:
>> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
>> to check the return value and return PTR_ERR() if failed.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Hi,

Could you please apply this patch?

Thanks,
Tiezhu

>
>> ---
>>   drivers/watchdog/bcm_kona_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
>> index eb850a8..8237c4e 100644
>> --- a/drivers/watchdog/bcm_kona_wdt.c
>> +++ b/drivers/watchdog/bcm_kona_wdt.c
>> @@ -279,7 +279,7 @@ static int bcm_kona_wdt_probe(struct platform_device *pdev)
>>   
>>   	wdt->base = devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(wdt->base))
>> -		return -ENODEV;
>> +		return PTR_ERR(wdt->base);
>>   
>>   	wdt->resolution = SECWDOG_DEFAULT_RESOLUTION;
>>   	ret = bcm_kona_wdt_set_resolution_reg(wdt);
>>

