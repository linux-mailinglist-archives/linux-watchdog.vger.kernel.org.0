Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0BAC184C16
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Mar 2020 17:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMQMn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Mar 2020 12:12:43 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:12635 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMQMn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Mar 2020 12:12:43 -0400
Received: from [10.28.90.144] (10.28.90.144) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Sat, 14 Mar 2020
 00:13:10 +0800
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     Julius Werner <jwerner@chromium.org>
CC:     Evan Benn <evanbenn@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Yonghui Yu <yonghui.yu@amlogic.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
 <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
 <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
 <CAKz_xw2T1UceCwFZnBxg6WVp2D4+MziyvQPdU6tEnR_BdLh-PQ@mail.gmail.com>
 <ad28aa47-0490-937f-898f-0e4695ef6ec6@amlogic.com>
 <CAODwPW9oxx33hkO3kv2_G8YyLWvigVHkfJU7xUHLVgB7QU2i3Q@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <6e846246-dfd5-c002-cd61-41c2d11a2e54@amlogic.com>
Date:   Sat, 14 Mar 2020 00:13:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAODwPW9oxx33hkO3kv2_G8YyLWvigVHkfJU7xUHLVgB7QU2i3Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [10.28.90.144]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Julius

On 2020/3/12 3:24, Julius Werner wrote:
>> - *_INIT and *GETTIMEOUT.      Although your driver does not need them, could you take them as options in your driver ?
> The driver already has SMCWD_INFO which is used during probe to
> retrieve the minimum and maximum timeout values supported by the
> hardware at probe time. Maybe it would make sense to rename that to
> INIT (which would still return those values, but can also do whatever
> initialization needs to be done in TF)?
Yes，INIT would make sense for me.
> GETTIMELEFT I agree we can
> implement optionally, and other platforms would just return a
> PSCI_RET_NOT_SUPPORTED for that.
>
>> - *_RESETNOW.      It is used to reset the system right now, similar to your SOFT RESET. could you reserve an operation index in ATF ?
> Just curious, why do you need this? Shouldn't you use the PSCI
> standard SYSTEM_RESET SMC for that? (If you want to control exactly
> how the platform is reset, you could also use SYSTEM_RESET2 with a
> vendor-defined reset_type.)
I just wanted it to be compatible with other OS，and I  think it over, 
maybe I can also use the
PSCI interface to execuate the system reset on the other OS. Anyway, 
please ignore this request.

Thanks.
>
> .
