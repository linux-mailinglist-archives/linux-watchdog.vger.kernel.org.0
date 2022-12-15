Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A3664E3E9
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Dec 2022 23:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiLOWqY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Dec 2022 17:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiLOWqT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Dec 2022 17:46:19 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E08F220E4;
        Thu, 15 Dec 2022 14:46:17 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9A4EC8532F;
        Thu, 15 Dec 2022 23:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671144376;
        bh=Mkhpcjlx+yoXwtfltcB91BTeHfWTJ4qdedB1Dwc1FT8=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=orgil7mqeGFK6wdRugEZd2gX+qRZO3X3JxSieExmmcwZ9lG/fPz19rkWkAeHcSPiI
         dsAOyuxLLuDhgY1QlwYZVqPKsI+gmVf3IEQ3PLj4jU8ORhlrDMOv5yfD2k34giqW0B
         f8Hx8gQg4RKat8fJsrWWszx1uui0qFVdYL+k/PpAuodS5keNIN4lTDqyL2lZhf9GoN
         BGniksOcU4NUIJJfsSJFzMIGu5rhWnDYKWfZMIG0yGgaE9VT+x+Cqp/s/wZW3H+rYy
         +bEziiLm74iJX4EpCncigaCQ037KKUdoRGzDOeCHVDy8JU+25yg52BR62a1ml7X4ju
         VBVZXXl2RjoHQ==
Message-ID: <f37d35a1-ca1a-a7bc-9a9c-83b684942447@denx.de>
Date:   Thu, 15 Dec 2022 23:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3] dt-bindings: watchdog: gpio: Convert bindings to YAML
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221107160338.27910-1-marex@denx.de>
 <167113639595.663197.15426353278060761950.robh@kernel.org>
 <aa28894d-86e0-dc50-4d23-f5c469ecd27d@denx.de>
In-Reply-To: <aa28894d-86e0-dc50-4d23-f5c469ecd27d@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/15/22 23:45, Marek Vasut wrote:
> On 12/15/22 21:37, Rob Herring wrote:
>>
>> On Mon, 07 Nov 2022 17:03:38 +0100, Marek Vasut wrote:
>>> Convert the gpio-wdt bindings from text to YAML ones, to permit DT 
>>> validation.
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: linux-watchdog@vger.kernel.org
>>> To: devicetree@vger.kernel.org
>>> ---
>>> V2: - Add missing required: properties
>>>      - Drop quotes around ref: referenced schema file name
>>> V3: - Add Guenter as maintainer of the bindings
>>>      - Add RB from Rob
>>> ---
>>>   .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 -----------
>>>   .../bindings/watchdog/linux,wdt-gpio.yaml     | 47 +++++++++++++++++++
>>>   2 files changed, 47 insertions(+), 28 deletions(-)
>>>   delete mode 100644 
>>> Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
>>>
>>
>> Looks like this was missed. Applied, thanks! You missed
>> 'always-running', so I added it from the other conversion that was
>> done[1].
>>
>> Rob
>>
>> [1] 
>> https://lore.kernel.org/all/20221125112904.48652-1-robert.marko@sartura.hr/
> 
> There is no 'always-enabled' DT property used anywhere in the Linux 
> kernel, at least 'git grep' in latest next-20221215 indicates so. Shall 
> we really add it in the bindings ?

Please ignore what I wrote, always-running was indeed missed.
