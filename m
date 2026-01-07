Return-Path: <linux-watchdog+bounces-4761-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAECFD474
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 11:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C72E23009AA4
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 10:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D13B31ED9D;
	Wed,  7 Jan 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAs5p4G1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ED231771B;
	Wed,  7 Jan 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782928; cv=none; b=DpOc7kUeo+ku4nUswqo1tITAKbWlAaZOlVhU6RDMJjXbfiloIGHQIBg068SvCdoS8wiMohodYqNFMNO4NtrgXCcNPQ30stR8lCk3WLBjZcvuIYfECa2Kfsccm1WdJmCBgCWrv7PiFV7VI4ddYiL5/11x6HkohUBfOStY2cKaiTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782928; c=relaxed/simple;
	bh=elz7b0vRGAXydvDoYJOal+0LEqRABOCnweSBG07nrMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2ofjB0x/pVfqS9hvS8HU0uNxbj62jsdrM0BnxbhvNibDVMWT7RpI9b4iXwlYKOHrAGb1+0NRnGhyYBb18dZuAhZxSB/qwqRZLf2m+BDCl3P4OU8x4imeEa6ZCznXTPb98JNl1TyDjCxBjewXnsoLAizOTkK2+839vjO56+Hgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAs5p4G1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8E9C4CEF7;
	Wed,  7 Jan 2026 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782928;
	bh=elz7b0vRGAXydvDoYJOal+0LEqRABOCnweSBG07nrMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAs5p4G1TrQaJQMQTBBrsEsxNhMhkIDdQ0ETldQ3iU6Z4EbbmdtUzplu/vcqt75jS
	 eqQdmfFcLf/OJi8OLgbmKIxOmWy6G3TBBqDR3mEX7TMUXJsPa6LrMe3VRKkJJDRZuc
	 hzbncfezVqvkHRuK8+TaSx/w7xzV7UYL0OszyJJKgvvrEni0NRRnpS50YLwHPG7o3U
	 peB3SoNvdgh0TLmlZVJy8eyXP8gU7x16PxDoBbx4rIn9scWnfgp3Lgu8HSbrnPqhpt
	 8MRTWAnisJvv7toMRPIgCe6rydcvj4HKNX09V0HM+AlHdvC3PDePgb1ah11pBaCZoa
	 DWr8d82WmcrPw==
Message-ID: <04d8766f-0f79-409b-9290-3170e99e9750@kernel.org>
Date: Wed, 7 Jan 2026 11:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
 <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2026 10:12, Nandor Han wrote:
> 
> On 12/30/25 14:34, Krzysztof Kozlowski wrote:
>> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>>
>> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>>> running in low power modes (STOP and DOZE). By default, the watchdog is
>>> suspended in these modes. This property provides the option to keep the
>>> watchdog active during low power states when needed.
>> And why exactly would that be a DT property? If system is sleeping
>> (assuming this is what you meant by low power), no one will pet the dog,
>> thus watchdog makes no sense.
> 
> Thanks for the feedback Krzysztof and Guenter.
> 
> In our case, low-power mode is disabled. However, we have identified that under certain conditions,

If your system has low power mode disabled, then you do not need this
property - you already know that watchdog must continue (or whatever you
want to achieve here).

> specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
> one of these power states.

Device as watchdog? I really do not understand your explanations, but
for sure system load is not relevant to DT property.

> 
>> Otherwise I fail to see how this is a hardware property and we do not
>> accept SW properties (see writing bindings, numerous presentations).
> 
> Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:
> 
> (From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
> ---
> WDZST
> Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
> once-only.
> ---
> Given that our system does not support low-power modes, we intend to enable the watchdog across all power
> states to ensure the device can recover properly under these conditions.

That's not what your property said. Your property said watchdog should
continue in low power modes. So when system enters low power mode, how
the watchdog petting would work?

Now you claim you want to enable it in low power mode but you do not
have low power mode? Does not make sense to me at all.

Best regards,
Krzysztof

