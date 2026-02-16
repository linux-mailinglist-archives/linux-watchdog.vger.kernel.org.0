Return-Path: <linux-watchdog+bounces-4947-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLsUGTUuk2mZ2AEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4947-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 15:48:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DA144CCD
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 15:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C25B30086ED
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Feb 2026 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F344271456;
	Mon, 16 Feb 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzRyjnI6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C26625;
	Mon, 16 Feb 2026 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253298; cv=none; b=Ivfs70v2pByWFlTRMFdlQiZQyfEJds5BKls1UUrOh0eINYKw7mvO8jnRchz5hpqTQN+dMM0Tlj7Zt83tOu0LVpLgATjL09VYpVOj5FRDGg+BQRxqpnfRu06jKWL83BDJquEF+jh5GPJvHfrYZC2PWBbeNgsEB6jUw7ZxvYmk4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253298; c=relaxed/simple;
	bh=L/dpP0UnrPD8okQGuiig4zPdY6ZsuqaFhbpDUBwz0xU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSaEexVAKjDKrrlVLLG4V4Mj/ibYB+BLTOY8TvMzW1Zm5jKD26xWY5Tu0cY6BO1vgwfw3IsICg71Aq/EqGhwePJvxxG0fCv+fwFQfwJ1wpkqqOauyequ1qXODwmv8MRuoPs7XcY9KlKiIHVws1ZHfTpWaRV/aoK/ixnpMH1poZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzRyjnI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31007C116C6;
	Mon, 16 Feb 2026 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771253297;
	bh=L/dpP0UnrPD8okQGuiig4zPdY6ZsuqaFhbpDUBwz0xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XzRyjnI6TCSAL5tfCk3P3bC0kboynMAO8qdqSwwKQYUKUIZ9zsSnF0aTLn4yARvdf
	 hF60Y4Cmol5oeHGCmtyVvnvWP+APmiemicPgLG34O9+pzJoP57aSVkgg2VOffQUMs8
	 Exo1iCuZAqSCTqvu2Qow27zx4HvQeiXs4cO6AnqXqiVDgpx7Y83ZS4XFjy7xIcnv4z
	 I69vtRk9yYJwapMSfWuwfyI90YnTQYxmpvNFsgva6Zp52yeFo92pmi8fiiPMxvRYR1
	 u1QYelE225o9utYvt9bJiVvFAwK2e9XQf0wAaR1qUrHFHD/U3UrvmanGWE1c+E5reI
	 RDX2LbwYakj8w==
Message-ID: <1522cec8-8259-4404-86fa-18bd91473087@kernel.org>
Date: Mon, 16 Feb 2026 15:48:12 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status
 support
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-2-tmaimon77@gmail.com>
 <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
 <CAP6Zq1jZorLxXQYqm5KzcYdoRzcFtD1KQqzmgaa6KKy-+Tpv+Q@mail.gmail.com>
 <92197c45-2921-47ad-9680-7339d6308b8f@kernel.org>
 <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAP6Zq1hLkT-xMwV99yVE-hLsf_nT+V_3v7sEshfqEkkRCkEevA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4947-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA0DA144CCD
X-Rspamd-Action: no action

On 16/02/2026 15:37, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments.
> 
> On Mon, 16 Feb 2026 at 13:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 16/02/2026 12:10, Tomer Maimon wrote:
>>> Hi Krzysztof,
>>>
>>> Thanks for your review.
>>>
>>> On Tue, 10 Feb 2026 at 18:11, Krzysztof Kozlowski <krzk@kernel.org>
>> wrote:
>>>
>>>> On 10/02/2026 14:38, Tomer Maimon wrote:
>>>>> Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
>>>>> integration. Document syscon property and three configurable reset type
>>>>> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
>>>>> nuvoton,ext2-reset-type)that map reset signal detection to specific
>>>>> reset bit positions.
>>>>>
>>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>>>> ---
>>>>>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
>>>>>  1 file changed, 49 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git
>>>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> index 7aa30f5b5c49..054cc0115af2 100644
>>>>> ---
>> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> +++
>> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
>>>>> @@ -12,7 +12,7 @@ maintainers:
>>>>>  description:
>>>>>    Nuvoton NPCM timer module provides five 24-bit timer counters, and a
>>>> watchdog.
>>>>>    The watchdog supports a pre-timeout interrupt that fires 10ms before
>>>> the
>>>>> -  expiry.
>>>>> +  expiry and reset status detection via syscon integration.
>>>>>
>>>>>  allOf:
>>>>>    - $ref: watchdog.yaml#
>>>>> @@ -40,12 +40,55 @@ properties:
>>>>>    clock-frequency:
>>>>>      description: Frequency in Hz of the clock that drives the NPCM
>>>> timer.
>>>>>
>>>>> +  syscon:
>>>>
>>>> First iteration. See "How to Get Your DT Schema Bindings Accepted in
>>>> Less Than 10 Iterations"
>>>>
>>> Thanks, it was very helpful.
>>> the syscon property is already found in the WD node
>>> in nuvoton-common-npcm8xx.dtsi file, what should I do:
>>
>> How is that file related to this binding?
>>
>> Either you document existing ABI or you add new (for new device). Commit
>> msg MUST be explicit about it and provide the reasons. If wrong (e.g.
>> discouraged) ABI was already used then it depends how and when it got
>> into the kernel, e.g. if someone bypassed DT completely just to get it
>> inside.
>>
> The syscon property is already used in the upstream NPCM8xx DTSI watchdog
> node, so I will document it as existing ABI and mark it deprecated. I will

And how it is used? I cannot find its usage, so I do not agree on
documenting it. Property should be removed or at least provide the
justification/impact of removal, if you need it to stay.

> add a new vendor‑specific property (nuvoton,sysgcr) as the preferred one,
> and explain this clearly in the commit message.
> 
>>
>>> 1. Modify the syson to nuvoton,sys-gcr like in the dtsi?
>>> 2. Still use the syscon property in the dtsi file, therefore stick with
>> the
>>> syscon add.


Best regards,
Krzysztof

