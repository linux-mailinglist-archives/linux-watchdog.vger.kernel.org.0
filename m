Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C6B124077
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2019 08:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfLRHhp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Dec 2019 02:37:45 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:15512 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfLRHho (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Dec 2019 02:37:44 -0500
Received: from [10.28.19.135] (10.28.19.135) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 18 Dec
 2019 15:37:49 +0800
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To:     Guenter Roeck <linux@roeck-us.net>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        <devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        <linux-kernel@vger.kernel.org>, Jian Hu <jian.hu@amlogic.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
 <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
 <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
From:   Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
Date:   Wed, 18 Dec 2019 15:37:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Originating-IP: [10.28.19.135]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Guenter Martin

On 2019/12/16 21:30, Guenter Roeck wrote:
> On 12/15/19 10:03 PM, Xingyu Chen wrote:
>> Hi, Martin
>>
>> Sorry for the late reply.
>>
>> On 2019/12/13 4:05, Martin Blumenstingl wrote:
>>> Hi Xingyu and Rob,
>>>
>>> On Thu, Dec 12, 2019 at 1:20 PM Xingyu Chen 
>>> <xingyu.chen@amlogic.com> wrote:
>>> [...]
>>>> +examples:
>>>> +  - |
>>>> +    watchdog {
>>>> +          compatible = "amlogic,meson-sec-wdt";
>>>> +          timeout-sec = <60>;
>>>> +    };
>>> in v3 of this patch Rob commented that there shouldn't be an OF node
>>> if there are no additional properties
>>> with timeout-sec there's now an additional property so my
>>> understanding is that it's fine to have an OF node
>> Your understanding is correct.
>>>
>>> what I don't understand yet is where this node should be placed.
>>> is it supposed to be a child node of the secure monitor node (for
>>> which we already have a binding here:
>>> Documentation/devicetree/bindings/firmware/meson/meson_sm.txt) or
>>> where else would we place it inside the .dts?
>> IMO,  Although the watchdog node need to reference the meson_sm node, 
>> there is no
>> bus-like dependencies between the devices which the two nodes 
>> corresponding to.
>> so i think that the watchdog node as child node of meson_sm maybe not 
>> appropriate.
>
> The watchdog driver needs the meson SM's dt node, and it depends on 
> the existence
> of that node. That seems enough of a relationship to warrant having it 
> as child note.
Thanks for your reply, if i take the wdt node as child of secure monitor 
(sm), how should
i register or find the wdt device ?

I only think of the following three methods :
1). update the sm driver，and scan&register wdt device when the sm driver 
probes(It is like i2c), but there
are too many changes involved.

2). add "simple-bus" key string to compatible of sm node, and it will 
make the child node is registered as
platform device, but it seems that the key string is not match current 
scene.

secure-monitor {
     compatible = "amlogic,meson-gxbb-sm",  "simple-bus";

     watchdog {
         compatible = "amlogic,meson-sec-wdt";
         timeout-sec = <60>;
     }
}

3).  don't register device, and find directly the watchdog node by using 
the of_* API in watchdog
driver (Eg: linux-4.x/drivers/tee/optee/core.c)

secure-monitor {
     compatible = "amlogic,meson-gxbb-sm";

     watchdog {
         compatible = "amlogic,meson-sec-wdt";
         timeout-sec = <60>;
     }
}

The method 3 looks better for me, do you have a better suggestion ? Thanks

BR
>
> Guenter
>
> .
>
