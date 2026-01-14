Return-Path: <linux-watchdog+bounces-4816-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA4D200EE
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jan 2026 17:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B24A3304AE55
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jan 2026 15:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139EF3A1A44;
	Wed, 14 Jan 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA8w8b4H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE92304BCB;
	Wed, 14 Jan 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406344; cv=none; b=pr386B/xjhtoq3uFDqyfwCa4wRdrHpTwcisEF4LQTBfBLo6/TRfYIA3IooyuJvUrAI2e3geFXGHFFT+iqVbiGXZZEMugz0HUovVuRqKSA55e/9cqBiIaTt683s64Pddn8zVfjnzVZjzQ2PSk4THe16JZ+UZM779ZwcUp57MJ63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406344; c=relaxed/simple;
	bh=QS7SeFGYO9O6xcOoIo97cX6Nf7H2BcdEECaiGjkLsB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ1tR9i6MXHAjalN6jzO0D1WCh6mqklGZb3LVZ1J5fd4WjtSNzAPVrQBjEbYZsGnj/hpviIdgHtF2seW2yhHiBVcK+YQLn2DIFpvfoos26E6CvBj3N+bOEPU1iOKGJoE2lqzFol7mpxd7Huh6FBR0k68nDhGDscrVr4ASFl9Igk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA8w8b4H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB60C4CEF7;
	Wed, 14 Jan 2026 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768406344;
	bh=QS7SeFGYO9O6xcOoIo97cX6Nf7H2BcdEECaiGjkLsB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TA8w8b4HDC+VSe/5R+ww2BESytB7iO0d2ZBddkANunV+G8osNluIKsIPxu3lCSSQu
	 mcWw9VRF1YKGncQhcQQBk8gE0Yv2ENVb9QqODkc7f64xI7P1zeMrZEK9lhY1NJJzs7
	 kYHw3A9NACKszs0MTqteRNKUQ8kO9NKnRBkxZ3FvLnCd61F0EW31wYF95garCShHLk
	 Dp9mGp7JzzfLj5M1nKNzJLjN3zldGbUV/UILZ1/62EgA4nNwg44zHiysui0Y9wTgSU
	 IEJH0fqeyEXKcOcN8/E/lCgs2tuNdOLe8Y8vMUHZr+Psf78P86oupZpVpvmiW1e5oh
	 3E3gdwGBlFgow==
Message-ID: <ed99a966-6c10-4156-846a-4ae02621dcf3@kernel.org>
Date: Wed, 14 Jan 2026 16:58:58 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue
 in low power mode
To: Nandor Han <nandor.han@gehealthcare.com>, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
 <20260112130849.3748465-2-nandor.han@gehealthcare.com>
 <e66a3dd5-1cf0-4d45-9ed2-55f50faaa0ae@kernel.org>
 <1359781c-a1cc-43ff-88e2-f381e8ab81d2@gehealthcare.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <1359781c-a1cc-43ff-88e2-f381e8ab81d2@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2026 14:22, Nandor Han wrote:
> 
> On 1/12/26 15:55, Krzysztof Kozlowski wrote:
>> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>>
>> On 12/01/2026 14:08, Nandor Han wrote:
>>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>>> running in low power modes (STOP and DOZE). By default, the watchdog is
>>> suspended in these modes. This property provides the option to keep the
>>> watchdog active during low power states when needed.
>>>
>>> Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets. See also:
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Apologies, will not do that on the next version.
> 
> 
> <snip>
> 
>>> +  fsl,wdt-continue-in-low-power:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: |
>> Do not need '|' unless you need to preserve formatting.
> 
> Thanks, will update.
> 
>>> +      If present, the watchdog device continues to run in low power modes
>>> +      (STOP and DOZE).
>> Not much improved. My questions how this petting is suppose to work
>> remain unanswered.
>>
>> Again, system load is really not relevant whether watchdog works or not
>> in low power mode.
> 
> Our use case is that we do not allow the CPU (i.MX7) to enter low-power modes.

That's very close to OS policy... or some sort of runtime choice.

> 
> To enforce this, we explicitly enable the watchdog during low-power states so that if the system enters such a mode for any reason, the watchdog will reset the CPU.

So finally this is explained. You actually want to trigger the bite by
lack of petting.

You can as well set the bit moment you put the system to suspend. You do
not need DT flag for this.

I unfortunately do not see how this could be anything else than OS
policy, so it is not suitable for DT. Maybe some rephrasing could help
and that's what I would expect usually, but I already raised objections
and then you sent v2 with the same ignoring these objections (really,
never do that), so I doubt that discussing will change anything and you
need very specific answer: no.

> Since in STOP and DOZE modes the CPU is halted and systemd can no longer service the watchdog, the watchdog will eventually trigger a reset.



Best regards,
Krzysztof

