Return-Path: <linux-watchdog+bounces-2205-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E099C06F
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 08:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF75228106F
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 06:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF5B1448E0;
	Mon, 14 Oct 2024 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGDiJthX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127FF17C91;
	Mon, 14 Oct 2024 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728888818; cv=none; b=UdoeySFuDsJ2i6shOPRaxSSgJHWjmaPUJ0RjgBBiFnWJSvIVWzz5mFUSXu/jzTTTUN2YqweHwET0jbDmUvvJCY+gKRCoQwpohUPiFXmkETGU/l8rBlvtPMlDKbxOLoU9TWJ3pH3PduN4Qbsq4OrcE+26ls3zmhrs5EYGuigSN+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728888818; c=relaxed/simple;
	bh=vhoTT8s1JGb/9tyN4DGENWhCfB9gXwEeAO5oMOAb7aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LloHLn24D75dt+q+7UtoQBWR06791KqPBlo+UoXwF22Fy7NIeFNl4oSUx33/BlVYOfzMAxyJlIsnaMb7U8Fv1pRvE7vb6JYmOuWFcOGmzqhU5UchRsaKvsoabNmJs1HLsS0svz6G/vy2XVE29Qw0ERutbLhQpbMvhlekfREmFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGDiJthX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A95EC4CEC3;
	Mon, 14 Oct 2024 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728888817;
	bh=vhoTT8s1JGb/9tyN4DGENWhCfB9gXwEeAO5oMOAb7aM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rGDiJthXelGmaTwGij9O2HN8zT8+ZII5jxPMQcX4j96XzkMorm3BM3AFpTfjsUbCw
	 qyVcCGJ33cm0bjqR0M+qCCnKo7QKysWkkTwrvEueGkM93vUeGMS6pv1gq/D3BlS/kv
	 P/hRVkr/rW9jzOclqpBMsMNuuAgsA89tV0RQrjblGYZziiGeR3vqJGRXQW+5bM9tKY
	 1aFWhgqQE4OQM2Xn0mXAUw7lLsEnK4/q1vZGwqVfpQ57gFHEtDzVQXRVdBNDBVL3M3
	 pgSeX1FhTCTZQVzEvDuk/D7GZhci1AhM1Y4N6izk7kHopaUZyQc4Mk+4GwuFlDTrVJ
	 HYgaAU89gA54g==
Message-ID: <e53369a9-c205-4297-b151-7a1e61d8459f@kernel.org>
Date: Mon, 14 Oct 2024 08:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
 SW reset
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
 "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
 "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
 "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>,
 BMC-SW <BMC-SW@aspeedtech.com>, Aaron Lee <aaron_lee@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
 <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
 <6bb599b4-141c-43a5-8b9f-4cf6ca6c3384@kernel.org>
 <TYZPR06MB5203B274C68C34FD478EA162B2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYZPR06MB5203B274C68C34FD478EA162B2442@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 04:07, Chin-Ting Kuo wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, October 7, 2024 2:58 PM
>> Subject: Re: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT
>> SW reset
>>
>> On 07/10/2024 08:34, Chin-Ting Kuo wrote:
>>> Add "aspeed,restart-sw" property to distinguish normal WDT reset from
>>> system restart triggered by SW consciously.
>>>
>>> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>>> ---
>>>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11
>> +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>>> b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>>> index be78a9865584..6cc3604c295a 100644
>>> ---
>>> a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.ya
>>> +++ ml
>>> @@ -95,6 +95,17 @@ properties:
>>>        array with the first word defined using the AST2600_WDT_RESET1_*
>> macros,
>>>        and the second word defined using the AST2600_WDT_RESET2_*
>> macros.
>>>
>>> +  aspeed,restart-sw:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: >
>>
>> Why >?
>>
> 
> ">" will be removed in the next patch series and the description content will be
> concatenated after the colon, ":".
> 
>>> +      Normally, ASPEED WDT reset may occur when system hangs or
>> reboot
>>> +      triggered by SW consciously. However, system doesn't know whether
>> the
>>> +      restart is triggered by SW consciously since the reset event flag is
>>> +      the same as normal WDT timeout reset. With this property, SW
>>> + can
>>
>> So DTS has this property and watchdog bites (timeout) but you will ignore it
>> and claim that it was software choice?
>>
> 
> No. Normally, when WDT is enabled, a counter is also be enabled. When the counter
> is equal to an expected value, timeout event occurs. AST2600 hardware supports a SW
> mode, when a magic number is filled into a specific register, WDT reset is triggered
> immediately without controlling the counter and the counter is not counted.
> Thus, WDT timeout doesn't occur.

How is this a no?

> 
>> This does not make much sense to me, at least based on this explanation
>>
>>> +      restart the system immediately and directly without wait for WDT
>>> +      timeout occurs. The reset event flag is also different from the
>> normal
>>> +      WDT reset. This property is only supported since AST2600 platform.
>>
>> Supported as drivers? How is this related? Or you mean hardware? Then
>> property should be restricted there.
>>
> 
> It is a hardware supported function on AST2600. For platform compatibility, without
> this property, all behaviors are the same as the previous generation platform, AST2500.
> 
> This property may be removed in the next patch series with referring to Rob suggestion

s/may/will/

> in the other reply. After checking with the major users, it is feasible to remove this
> property and using SW reset by default when the restart operation is triggered by SW
> deliberately on AST2600 platform.
> 


Best regards,
Krzysztof


