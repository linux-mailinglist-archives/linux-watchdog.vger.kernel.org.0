Return-Path: <linux-watchdog+bounces-1418-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CE939057
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 16:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA896B216E2
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2024 14:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C913316D9C9;
	Mon, 22 Jul 2024 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqfOb+qm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC661DFE3;
	Mon, 22 Jul 2024 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657298; cv=none; b=gFw+vRSs0zJx4XFTnlRPH8Zudvf62v5X/LbrRZC5GgxSWV7NpouZXxG7CR2iWLcxEwrTEB1TtB1SsZJbyi58jmVf0fAGLZ3e8jFeYljcISfaUSdZi9pt5Twf5Rne4iJPfJfAZceOcTcGfwg//xy8VqLePuSq7E8lTo1+Dhs4mh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657298; c=relaxed/simple;
	bh=N6IiowuXKaiT8NYw3UN1F4KTF+aBzmB19xg+QeJxfA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaZWNQUqtrBCB6gY58hFdOkqPzK7Bj8nYT1vb64Gmdr9k5xkSDafXUrU9HyTx/0vSddTlCv5eWiTDRklJPi9KkKidNbj5fcQLHYkFkb3pZ4bHc1LVu2T0FigqvukAaAZBcBERXyQwhBa+R6nUDRnSiqXt/35fTUq8XMOQNn71kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqfOb+qm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DD8C116B1;
	Mon, 22 Jul 2024 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721657298;
	bh=N6IiowuXKaiT8NYw3UN1F4KTF+aBzmB19xg+QeJxfA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dqfOb+qm3Gr6Tc7r8QA6xQiAIdbGcNUDKMfw+LGZrdiPCD0Up4ptskT7f12pMMHSS
	 rtYmNc5Q8RGAvYqccBiX65mUSF9N+JxwAbcVP4Y2qC/OWDj6K2hbeT6YghJB1SfALf
	 POCTluzGcPx0xzfzMwYc+crZ6suafKeephJdUouF4+myIdIhS+DrWi1FZmJmiqMCBP
	 hP80dTaczo79KB9r3BCheVE8aPlD7Z84Qkp9ijlN5m8e6A7gRWUd0DpYY3kpwUSqpi
	 HkTzsY1gk+fiJNVt9i4/dm477pOzGpmVtXYL/Jbpg/7N7UNM62o8sjPuzcwW6WHuaA
	 8XdMFA4zzPoEg==
Message-ID: <0f1becb9-56e9-4b71-b9ca-263dd6592c43@kernel.org>
Date: Mon, 22 Jul 2024 16:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] dt-bindings: watchdog: ti,davinci-wdt: convert to
 dtschema
To: Kousik Sanagavarapu <five231003@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240721170840.15569-1-five231003@gmail.com>
 <20240721170840.15569-3-five231003@gmail.com>
 <629a925c-24ef-4a44-832f-a06a60c266a7@kernel.org>
 <Zp5asqhipQHEoviM@five231003>
 <2d8ceef8-9d5e-42a9-af2e-f9292728a3bf@kernel.org>
 <Zp5mkcDca6jRvOnf@five231003>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Zp5mkcDca6jRvOnf@five231003>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2024 16:02, Kousik Sanagavarapu wrote:
> On Mon, Jul 22, 2024 at 03:50:15PM +0200, Krzysztof Kozlowski wrote:
>> On 22/07/2024 15:12, Kousik Sanagavarapu wrote:
>>> On Mon, Jul 22, 2024 at 10:15:03AM +0200, Krzysztof Kozlowski wrote:
>>>> On 21/07/2024 18:28, Kousik Sanagavarapu wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - ti,davinci-wdt
>>>>> +      - ti,keystone-wdt
>>>>
>>>> This does not match the original binding and commit msg did not explain
>>>> why such change is necessary.
>>>
>>> I don't understand.  Do you mean both the compatibles are always
>>> compulsory?  Meaning
>>>
>>> 	compatible:
>>> 	  items:
>>> 	    - const: ti,davinci-wdt
>>> 	    - const: ti,keystone-wdt
>>
>> Yes, this is what old binding said.
> 
> That was what I thought initially too, but the example in the old
> binding says otherwise and also the DTS from ti/davinci/da850.dtsi
> says
> 
> 	wdt: watchdog@21000 {
> 		compatible = "ti,davinci-wdt";
> 		reg = <0x21000 0x1000>;
> 		clocks = <&pll0_auxclk>;
> 		status = "disabled";
> 	};
> 
> Or am I seeing it the wrong way?
> 
>>>
>>> It is enum because I intended it to align with the subsequent patch
>>> which changes DTS.
>>>
>>>> This also does not match DTS.
>>>
>>> Yes.  I've asked about changing the DTS in the subsequent patch.
>>>
>>
>> Changing the DTS cannot be the reason to affect users and DTS... It's
>> tautology. You change DTS because you intent to change DTS?
> 
> Not exactly.  I thought that the DTS was wrong when it said
> 
> 	compatible = "ti,keystone-wdt", "ti,davinci-wdt";
> 
> while it should have been
> 
> 	compatible = "ti,keystone-wdt";
> 
> I was not sure about this though and hence marked both the patches as
> RFC, in case I was interpretting them the wrong way.

Ah, right, the DTS says keystone+davinci while old binding suggested
davinci+keystone. Considering there is no driver binding to keystone, I
think the answer is obvious - intention was keystone+davinci. Anyway,
commit msg should mention why you are doing something else than pure
conversion.

Best regards,
Krzysztof


