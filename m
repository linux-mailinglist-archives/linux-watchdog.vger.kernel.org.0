Return-Path: <linux-watchdog+bounces-2736-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D0A15DCA
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 16:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6F953A8C93
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B7119AD87;
	Sat, 18 Jan 2025 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ3UbyJH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2218FDC2;
	Sat, 18 Jan 2025 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215492; cv=none; b=f9Rw/+2GtCyryxxYM191DT2FhjValiuslUYJ2LFWAMTws1r5yBUDhs/0dxk7/xwlcbbSWTLGNLVWtNblgc2r8yzeks4ayfXaatH61cLbQF+liXPbSWAt4h1Xh4fTsSOzbfmMvR7NtB6k8mBSLou3qLZNCDcjQNGrVpsXb8mcM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215492; c=relaxed/simple;
	bh=5GcbwXBNBTKYoeuhuiGvm8wuMVgR05o7ai4R7wqFD3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8t/xKWGNZkj5jacXLJ8jVo+V2fFmWLNrATZvj2VZIkOTWmkMCAWF33UhULOVoU5RjA4nKWlVaNDpmZFVaOzaizkOSwd8w5jatL0z7CIJBGEGwYuNHFT+1ljmt+0ziyv/34I4J//DKd7CgjABl/cnq0YQiTE2xT6Y+LeSIkNW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ3UbyJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B54C4CED1;
	Sat, 18 Jan 2025 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737215491;
	bh=5GcbwXBNBTKYoeuhuiGvm8wuMVgR05o7ai4R7wqFD3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJ3UbyJHysKMeuah6RBjPjvn4SqWwd0GfCM+kKlYjQr6F8rMQYIwl5R2DP6IVG71F
	 FcYnZrsW9ZpZ4bpHodjvUxwjCEOwNQouaRjluayq8v4fktMmqQ6sKtv8wLnAOxFtqv
	 5v5KenYa9fCgwCtXavqV/fzUeZjzemPoEybwpYKJsa9wnYIxVeMf788uyrSQ0mzG6J
	 f2IHyY7dHtc4UON7+GL5GXTv7PBqww5+bF0XYRM90GF6G1h7gRURgWQ4gle9eEn94b
	 ms+0RzlnUIVuW3nvjVKd9M/B31lKm2Qf4MhqYZSFkaIfNBUjYht28Jc0JKdhrVpdI8
	 rq1gCC2yVc6ZQ==
Date: Sat, 18 Jan 2025 16:51:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on
 ARCH_R9A09G47
Message-ID: <20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115103858.104709-4-biju.das.jz@bp.renesas.com>

On Wed, Jan 15, 2025 at 10:38:52AM +0000, Biju Das wrote:
> RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H.
> Add Kconfig dependency for RZV2HWDT driver with ARCH_R9A09G47 and
> update the help description.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/watchdog/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..646a84cc03e3 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -963,13 +963,14 @@ config RENESAS_RZG2LWDT
>  	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
>  
>  config RENESAS_RZV2HWDT
> -	tristate "Renesas RZ/V2H(P) WDT Watchdog"
> -	depends on ARCH_R9A09G057 || COMPILE_TEST
> +	tristate "Renesas RZ/{G3E,V2H(P)} WDT Watchdog"

This is close to churn...

> +	depends on ARCH_R9A09G047 || ARCH_R9A09G057 || COMPILE_TEST

But this is just wrong. You are supposed to depend on renesas ARHC, not
your individual SoC (and this is what you called here "ARCH_R9A...").

Greg many times gave strong opinion that even full ARCH is wrong and we
managed to convince him that it has a meaning (or he did not want to
keep discussing). But restricting it per soc is pointless and
impossible to defend in discussion.

Best regards,
Krzysztof


