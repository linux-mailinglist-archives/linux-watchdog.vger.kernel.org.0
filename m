Return-Path: <linux-watchdog+bounces-2597-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 035969F7ECC
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 17:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F431188FDC4
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Dec 2024 16:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494B086349;
	Thu, 19 Dec 2024 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0t0JgTZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109B3D3B8;
	Thu, 19 Dec 2024 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624096; cv=none; b=Gal86AOlHLqA+hiTUvJfXP25MoaaQJ+a93huMAWkl6Wb92b55byDLNIOz1DQcjLgR5uxqgQXZUZQKi5MBX7j0wuJzTaXucHkcohB9Cx+W19T9pQGDAUTIN33hh0TB4OXo6FFF5OXn46u7UYR4vqypW+U+ZDQMF9AsXUjbkXuMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624096; c=relaxed/simple;
	bh=6uMXLt4ypoVy4tnF262rE8ywognqpxGkvT/QWn0rhzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCvBjlJsFMTMfclE8cxMv53QyOZ4m8eZJox3p7t6kSu5jhYuFkRbZ6OSV/OGRJvPKbb09KkGFtW8Qi0FYfrOwu1oaSUHZz9QyGhWBf1BjCfW5sm4acwLoWyiVEQOKJZtfRbVfyzBqk9TK0pyW+gb5ZQNFVCkHdM99a9JNFYUHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0t0JgTZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F19AC4CECE;
	Thu, 19 Dec 2024 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734624095;
	bh=6uMXLt4ypoVy4tnF262rE8ywognqpxGkvT/QWn0rhzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n0t0JgTZSvmIkwYofKJIgfgS/+mu4+SGUIX/F2aTqz+7jiWZp4w3/sCMhPQHNZBSr
	 otN+aFzz3XQN7FtOv14YEDaJx+K2vpZ6vYf9WqG1w09ptH5GhoL8N0VyMY8PjlOvi0
	 PbnD1YDzTE95cK1M8JQiml0Lik3EOQ6d5SbMcpQyxpjy9gRhV4w0wa30OLfQ2yWQMO
	 HSl0ooym3wmU/sYqcXGfuJGmCICHywWnQH/dAPjiMXGE8OdgL+r0pXj0rJNLLH1kiF
	 1RyPrzywJRNGUHLDI7DKroHpEpC+OxkL0GK4OQ92NSH/Bj/kVHSGD0BqFqSokiGdGF
	 cOaNO/eSok4MA==
Message-ID: <53c2fc82-2b09-4f7e-a89f-c7c16c38cb8e@kernel.org>
Date: Thu, 19 Dec 2024 17:01:25 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: renesas: Document
 `renesas,r9a09g057-syscon-wdt-errorrst` property
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <wouo4k7rd7y57jzez3qdrz27fscozofuksgs4ivft75y6cwvqa@zfq3wgerwaza>
 <CA+V-a8s-_OMJy=4v_whpBr7S4aE3Dn6KouFfCnQ=oUBM9MD4nA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CA+V-a8s-_OMJy=4v_whpBr7S4aE3Dn6KouFfCnQ=oUBM9MD4nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 11:06, Lad, Prabhakar wrote:
>>> To facilitate this operation, add `renesas,r9a09g057-syscon-wdt-errorrst`
>>> property to the WDT node, which maps to the `syscon` CPG node, enabling
>>> retrieval of the necessary information. For example:
>>>
>>>     wdt1: watchdog@14400000 {
>>>         compatible = "renesas,r9a09g057-wdt";
>>>         renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 1>;
>>>         ...
>>
>> Drop, obvious.
>>
> Ok.
> 
>>>     };
>>>
>>> The `renesas,r9a09g057-syscon-wdt-errorrst` property consists of three
>>> cells:
>>> 1. The first cell is a phandle to the CPG node.
>>> 2. The second cell specifies the offset of the CPG_ERROR_RSTm register
>>>    within the SYSCON.
>>> 3. The third cell indicates the specific bit within the CPG_ERROR_RSTm
>>>    register.
>>
>> Don't describe the contents of patch.  Drop paragraph. There is no need
>> to make commit msg unnecessary long. Focus on explaining unknown parts
>> of commit: why? or who is affected by ABI break? why breaking ABI?
>> instead of repeating diff.
>>
> Ok, I'll drop the para. There isnt any ABI breakage as the driver
> patch [0] will skip supporting watchdog bootstatus if this property is
> not present.
> 
> [0] https://lore.kernel.org/all/20241218003414.490498-6-prabhakar.mahadev-lad.rj@bp.renesas.com/

Really? I see in rzv2h_wdt_probe():

+		if (ret)
+			return ret;

so to me you are failing the probe, not skipping anything.

> 
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> index 29ada89fdcdc..8d29f5f1be7e 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>>> @@ -112,6 +112,19 @@ properties:
>>>
>>>    timeout-sec: true
>>>
>>> +  renesas,r9a09g057-syscon-wdt-errorrst:
>>
>> There are never, *never* SoC names in property names, because we want
>> properties to be re-usable.
>>
> I should have mentioned this in my commit message (my bad). The
> renesas,wdt.yaml binding file is being used for all the SoCs
> currently. To avoid any conflicts by just having vendor specific
> property I added SoC name to the preoperty.

I know what you did and I replied: that's a no go for reasons I stated.

> 
> @Geert/Wolfram - Maybe we need to split the binding on per SoC bases?

You can but I don't understand why exactly.

> 
>> Make the property generic for all your devices and be sure to disallow
>> it everywhere the CPG_ERROR_RSTm *does not* exist (which is different
>> from "where CPG_ERROR_RSTm is not used by watchdog driver").
>>
> This patch already disallows `renesas,r9a09g057-syscon-wdt-errorrst`
> for the rest of the SoCs and only allows for RZ/V2H(P) SoC or am I
> missing something?

No, that's fine, but to avoid disallowing it for others you named it per
SoC.

> 
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description:
>>> +      The first cell is a phandle to the SYSCON entry required to obtain
>>> +      the current boot status. The second cell specifies the CPG_ERROR_RSTm
>>> +      register offset within the SYSCON, and the third cell indicates the
>>> +      bit within the CPG_ERROR_RSTm register.
>>> +    items:
>>> +      - items:
>>> +          - description: Phandle to the CPG node
>>> +          - description: The CPG_ERROR_RSTm register offset
>>> +          - description: The bit within CPG_ERROR_RSTm register of interest
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -182,7 +195,11 @@ allOf:
>>>        properties:
>>>          interrupts: false
>>>          interrupt-names: false
>>> +      required:
>>> +        - renesas,r9a09g057-syscon-wdt-errorrst
>>
>> No, ABI break.
>>
> As mentioned above we won't break ABI, this required flag is for future changes.

Then why is this required? Or at least explain this in the commit msg.

Best regards,
Krzysztof

