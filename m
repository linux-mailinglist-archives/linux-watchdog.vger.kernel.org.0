Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7626B3B51
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Mar 2023 10:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjCJJuL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Mar 2023 04:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbjCJJuA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Mar 2023 04:50:00 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66241BC78B;
        Fri, 10 Mar 2023 01:49:35 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id F07B8660305B;
        Fri, 10 Mar 2023 09:49:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678441774;
        bh=yiAeYd9DeEU6lHZ8YggZjRVIamxT29ljlgOsGQz7ulU=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=joULOdS9TNE4snx3Otmzxqjaqu2JQJm69oUVShdIYRkDD5Ev1sXLTFDYYfmgj5dk4
         AhAgj8mxVtYLMaT00QVTdRn87varPFkK1Nl5ASHoSLBwf8kAL39iEjLvxTnz/U9OkH
         xajLDjozMCAe9J1TJg0RyDnLt9f6b7ZuH+crOz5qL+ZDCfcf3zpV65jgVYBbXPg8Aw
         ct6jHgr4cheu7UM+FXDUuI7t6aQZTYnlNxhlQE9gOyVqFFFqPVqCa0+OmvXpxf0E8l
         bG362xEVxzLosPscZmBsN5NhikQsLlFmxwEZIB+quCssiaK499mUwig5mLe0e2Bu9U
         3PySLDmrP4B0w==
Message-ID: <62ed2988-2347-9fd9-82f9-6dcc9ae75808@collabora.com>
Date:   Fri, 10 Mar 2023 10:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
 <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org>
 <6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com>
In-Reply-To: <6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Il 10/03/23 10:46, AngeloGioacchino Del Regno ha scritto:
> Il 10/03/23 09:32, Krzysztof Kozlowski ha scritto:
>> On 07/03/2023 14:17, Alexandre Mergnat wrote:
>>> This SoC is able to drive the following output current:
>>> - 2 mA
>>> - 4 mA
>>> - 6 mA
>>> - 8 mA
>>> - 10 mA
>>> - 12 mA
>>> - 14 mA
>>> - 16 mA
>>>
>>> Then drive-strength property is set with enum to reflect its HW capability.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml 
>>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>>> index 4b96884a1afc..101871ec6693 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
>>> @@ -79,6 +79,9 @@ patternProperties:
>>>             bias-pull-down: true
>>> +          drive-strength:
>>> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
>>
>> Isn't this conflicting with mediatek,drive-strength-adv? Your commit msg
>> suggests you add a missing property, but I would say nothing was missing
>> here.
>>
>> You need review from (pinctrl) Mediatek maintainers how the bindings for
>> all Mediateks are organized.
> 
> Hello Krzysztof,
> 
> mediatek,drive-strength-adv *shall not exist*, that was an unnecessary property
> that leaked upstream from downstream kernels and there's no reason to use it.
> 
> Upstream, we have drive-strength-microamp and mediatek,rsel-resistance-in-si-unit.
> 
> Since mediatek,mt8365-pinctrl.yaml got picked with that property already, I have
> nothing to complain about this specific commit... drive-strength does not conflict
> with the mediatek,drive-strength-adv property, as the "adv" is for microamp
> adjustments.
> 
> You can pick it, it's fine.
> 
> Anyway, Alexandre: can you please perform a cleanup to the MT8365 pinctrl binding?
> The cleanup means you're setting mediatek,drive-strength-adv as deprecated and
> adding the right properties (...and possibly changing the devicetrees to use it).
> 
> For more information, you can look at commit history for the (unfortunately, named
> incorrectly) MT8195 pinctrl documentation: bindings/pinctrl/pinctrl-mt8195.yaml
> where we performed the same cleanup that I'm asking you to do, except we didn't
> have to set any property as deprecated because there was *no devicetree upstream*
> that was actually using that property (hence not an ABI breakage).
> 
> Cheers!
> Angelo

Sorry for the double email. I forgot to give my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Whoops!
Cheers again  :-)

