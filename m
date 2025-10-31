Return-Path: <linux-watchdog+bounces-4490-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F196C250C5
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 13:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810301898553
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 12:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988FC346FD5;
	Fri, 31 Oct 2025 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckIMRIcw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0B340DB2;
	Fri, 31 Oct 2025 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914358; cv=none; b=atPAgzzL9bPQp+OoYbe9D4p6GCgmxTV9ywoPjHZfJwCwmXE+uKDWLjrOPghVl5+1Ps01EAr5oqS3DXOJvZ0nSvkJz7i8b4aZ+6FDCti8yA93U8cYzGe9QWmwgqzRJQU2F1RauLCKWeZej9IpmYm65Ii79kTsgqEVS6sOQWu2gB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914358; c=relaxed/simple;
	bh=Mf3SBZaReDiM9X2FtR7wf7HpZfO4MPTDbwjoFqP0IJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEpSCCfzAIDEqg3ZgS9lSbG4yeNPE8lGJBHhEy6Laqw1uq9ir4857+0uzY99JUjiBepaRu17ESWv52y/3lnIrBQJFEAKb6Gj6eitENwlGtRNF8uAdm8qQOVQ57OqPVoRwzmWfrILhcNC56GWxVbQdsm1Q4NaS7MzRHB+v+I+/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckIMRIcw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A838CC4CEFB;
	Fri, 31 Oct 2025 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761914357;
	bh=Mf3SBZaReDiM9X2FtR7wf7HpZfO4MPTDbwjoFqP0IJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckIMRIcwmsh/SXoQyLum0k4EjM7BUnZTJe6YsgD4+zIaE5IXtJdMcJZ6s5GHHZODw
	 Vi1XK4YJZSFZvTrZTWWwcJ3ykywumwaBB9SllrOuTGbIy3fYXyKjfkHCit7bsAH4RB
	 UcmyphbnpSWkoQDvtczmVPmPzKXIxJ8tNlaf5o7k7q1bY+A42DRUjkNdkbyg5LlXdL
	 iN7FzrF7qE+FEV6M0WjZSJUuWEKw90xRb6b03yRLBLPCgJ86Cpm+9wCrflquRk/qcU
	 aJQBNgqju6T/yYXcKZs5u+IIW/K7ka2POsP7L4I9wJu0IAKNd0FiioEmoTqo4P/a3w
	 nphJKx1+eo13A==
Message-ID: <68b2b40a-da98-46b8-bf48-ce17fb3b79cd@kernel.org>
Date: Fri, 31 Oct 2025 13:39:11 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <13d2963d-e931-4e51-b875-a1650b899bb7@kernel.org>
 <09e8485f-f512-4069-be9f-3e94fb142aa3@quicinc.com>
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
In-Reply-To: <09e8485f-f512-4069-be9f-3e94fb142aa3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2025 13:11, Pavan Kondeti wrote:
> On Fri, Oct 31, 2025 at 12:48:18PM +0100, Krzysztof Kozlowski wrote:
>> On 31/10/2025 11:18, Hrishabh Rajput via B4 Relay wrote:
>>> +
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
>>> +
>>> +static struct platform_driver gunyah_wdt_driver = {
>>> +	.probe = gunyah_wdt_probe,
>>> +	.driver = {
>>> +		.name = "gunyah-wdt",
>>> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
>>> +	},
>>> +};
>>> +
>>> +static int __init gunyah_wdt_init(void)
>>> +{
>>> +	return platform_driver_register(&gunyah_wdt_driver);
>>> +}
>>> +
>>> +module_init(gunyah_wdt_init);
>>
>>
>> Heh, what was my last message? If I see module_init() I will NAK it.
>>
>> At v3 you really ignored entire feedback and this one here continues the
>> pattern.
>>
>> NAK, please read how Linux driver model is works.
> 
> You mentioned in your previous reply that
> 
> ```
> If you call any module_init other than module_foo_driver I will keep
> NAKing your patch because it is wrong. I explained why wrong already
> multiple times in previous threads and other discussions.
> ```
> 
> If you are referring to why module_platform_driver() is not called here,
> Hrishabh answered that already previously. Please see
> https://lore.kernel.org/all/ndwwddd7vzjpgvzg55whdno4ondfxvyg25p2jbdsvy4lmzsfyy@jnn3wywc7xtp/
> 


Your commit msg does not explain why this cannot be unloaded. What you
want - intended to be a persistent module - is not relevant here. I want
it to be a proper and regular driver module and I said it last time.

Best regards,
Krzysztof

