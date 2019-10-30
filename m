Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2EFE9BEE
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2019 13:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfJ3M7U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 30 Oct 2019 08:59:20 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:48349 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3M7U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 30 Oct 2019 08:59:20 -0400
Received: from [10.28.19.135] (10.28.19.135) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 30 Oct
 2019 20:59:28 +0800
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To:     Rob Herring <robh@kernel.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com>
 <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
 <20191025203030.GA28391@bogus>
 <1914e315-3cb7-9251-f871-0024e0e4f68b@amlogic.com>
 <CAL_JsqLr-Cgu4yZFGTfO=qpFPLBZ1gb-1+DZ35eQX3dUsadm4g@mail.gmail.com>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <2808a8c9-a835-2706-f300-0deb924d3686@amlogic.com>
Date:   Wed, 30 Oct 2019 20:59:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLr-Cgu4yZFGTfO=qpFPLBZ1gb-1+DZ35eQX3dUsadm4g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.28.19.135]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,Rob

On 2019/10/30 4:51, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 3:35 AM Xingyu Chen <xingyu.chen@amlogic.com> wrote:
>>
>> Hi, Rob
>>
>> On 2019/10/26 4:30, Rob Herring wrote:
>>> On Fri, Oct 25, 2019 at 02:13:02PM +0800, Xingyu Chen wrote:
>>>> The binding targets the Meson-A/C series compatible SoCs, in which the
>>>> watchdog registers are in secure world.
>>>>
>>>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>>>> ---
>>>>    .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 ++++++++++++++++++++++
>>>>    1 file changed, 34 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
>>>> new file mode 100644
>>>> index 00000000..0bbc807
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
>>>> @@ -0,0 +1,34 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +# Copyright (c) 2019 Amlogic, Inc
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yaml#"
>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>> +
>>>> +title: Amlogic Meson Secure Watchdog Timer
>>>> +
>>>> +maintainers:
>>>> +  - Xingyu Chen <xingyu.chen@amlogic.com>
>>>> +
>>>> +description: |+
>>>> +  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - amlogic,meson-sec-wdt
>>>
>>> If there are no other properties, then you don't need this. Just have
>>> the secure firmware driver instantiate the watchdog.
>> I'am very sorry i don't understand how to initialize the watchdog driver
>> if the compatible property is removed, Could you give me more
>> suggestions or examples ？ Thank you very much.
> 
> platform_device_register_simple() from the secure firmware driver.
Thanks for your help. The device node of wdt looks useless if I use this 
function to register device. if so, how should I get the pointer to 
secure-monitor in wdt driver ? or should I use directly arm_smccc to 
access the secfw ?
> 
> Rob
> 
> .
> 
