Return-Path: <linux-watchdog+bounces-4746-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5BCE9B06
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 13:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A193303BE2D
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Dec 2025 12:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD74F20311;
	Tue, 30 Dec 2025 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy2zL7cG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A528DB56;
	Tue, 30 Dec 2025 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098128; cv=none; b=nTIZDl9t0G1Hpth8Z38Gcc9FP2rTj+rx8lEbB2ujG1O/qTZ4MoUc5yNVaX4t9kxL+jSK8ncIJi8nySTYQllZ3rN4z1CUnqeyPOr0xpIDuSQIZ17OzfdSLRFLMehb+XmiQFrUBZtMATq3dblIF+hT/dUQhfdUO0Eo7ALtdBE8M/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098128; c=relaxed/simple;
	bh=SwXASAmQsuqXGdIcB4eRnI5om/oEaYAfTTSnerxLjyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1XHcYSNjxDQJjhX1lWl2LfDl9xAI4SITAHQj9mYF4HinRce4Lzeno/eRxMJ7n2IDKblaayUXRX/P/+Z+k5iqYL+/pfU4TgdIxQX9TD1cjEm1RAYfIQHT0XBW7wXKBgY2Ea74o1+yISn2J40SWgQBliCQyKbpjH3X9zdZIObpJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iy2zL7cG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786ACC4CEFB;
	Tue, 30 Dec 2025 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767098128;
	bh=SwXASAmQsuqXGdIcB4eRnI5om/oEaYAfTTSnerxLjyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy2zL7cG8hPx+Unpu0jiQyHR689YJWOIYrXyIpxfjqgQAr14gqwuqn7yov1TYySzs
	 5buxKOemldUeDUEYWnlhpZQzM2Zq9hk010n5K5p1wPeCuQ5ADXR3yjVTLd29wpG2hc
	 GgHiZZcOWzOKgGhoFfHqlU0k+jyo88NguhGUChys+yzE3rO7vOH2Nsnoy8kd0AsBBS
	 zVhvmX/Qf7Sg9juDQFEQ9X6XOFmyx+UlHe+d+VORUWumY0QKPXKSIZLLIJUNGCJWgI
	 b4CEr77XJo+VOQ+ucBZB28tw1TEARb1H2Mt9jjN+5E7TOvVQiaH7l7/a937CSCEeNR
	 ulYUZZoul5aAg==
Date: Tue, 30 Dec 2025 13:35:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
Message-ID: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-2-nandor.han@gehealthcare.com>

On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
> By default, the driver suspends the watchdog in low power modes (STOP
> and DOZE). In some situations this is not desired.
> 
> Add the possibility to configure the continuation of the watchdog timer
> in the above mentioned low power modes.
> 
> Note:
> Please be advised that the difference between the variable name and the
> device tree option has been intentionally selected to uphold the
> prevailing driver functionality. This ensures that the watchdog remains
> suspended by default in low power mode, while also facilitating a clear
> and intelligible device tree option name.
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof


