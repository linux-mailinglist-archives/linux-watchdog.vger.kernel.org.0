Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F73C168C40
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Feb 2020 05:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgBVEBD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 23:01:03 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:57549 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgBVEBD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 23:01:03 -0500
Received: from [10.28.90.152] (10.28.90.152) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Sat, 22 Feb 2020
 12:01:26 +0800
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Julius Werner <jwerner@chromium.org>
CC:     Evan Benn <evanbenn@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
Date:   Sat, 22 Feb 2020 12:01:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.28.90.152]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Julius

On 2020/2/22 3:41, Julius Werner wrote:
>> Because the ATF does not define standard wdt index, each vendor defines
>> its own index.
>> So I don't think that the current driver[0] can fully cover my usecases.
> I think the best way to solve this would be to put the SMC function ID
> as another field into the device tree, so that multiple vendors could
> share the same driver even if their firmware interface uses a
> different SMC. But they still have to implement the same API for that
> SMC, of course, not sure if the Meson driver is suitable for that (but
> if it is then I think merging those drivers would be a good idea).
The SMC function ID may be solved by the DTS, but the wdt indexs(Eg: 
SMCWD_INFO) are also different
for each vendor. The imx_sc_wdt.c is also use the SMC to operate the 
WDT, but the wdt indexs(Eg: IMX_SIP_TIMER_START_WDOG)
are different from ours. IMO, If the ATF can implement a common hal 
interface and index for watchdog, then writing a
common smc wdt driver will be easier to compatible with all vendors.

Best Regards
>
> .
