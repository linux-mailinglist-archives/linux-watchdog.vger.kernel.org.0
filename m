Return-Path: <linux-watchdog+bounces-4959-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNByLKa/m2no5gMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4959-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 03:47:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913417177B
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 03:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DC3A303E48C
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 02:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FBB2777F3;
	Mon, 23 Feb 2026 02:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBENUKQY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1AE274FEB
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771814634; cv=none; b=nXDXEHFuzjNln3vYNn+k5TXM2H/RhRY3OyqfOFOPoz/nOG0K94TB34UHPXIBwfQe1Xs2SVNZcaJvgErOYcp71M2wyn1tYySyJrUHEPXluDyBV0qRi2qQpY1R759JKqw9a7freOYohiOr9jUe/2XpGM0N7RbwHd7HsA5cNQPvwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771814634; c=relaxed/simple;
	bh=ipONHyfQefwJ+wWKjxwcC65iwoDE4YHxJIy1dYdVvaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLBFOaAYrxtaeHctqy88EL8/+23kgF92m5HiZlMeKKbPbQshfc0qCFb5DWuG8SuTBN59b9OtNYtKUC41ZVPXH2KYUmla64NEXk36ly7r8ycAiQhT6CharMnmk7VKgsF+ebzqPZSOiqEAYxm3/GiRsYhhZToC1iEpVo+LclczSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBENUKQY; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4b77adso4555722c88.1
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 18:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771814631; x=1772419431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljL4rppbd2e4wqdN+iebDJxhwWgT1e5IA+58B3ERr20=;
        b=fBENUKQY2NiCWgnZxWILxxLzhlZVw95kq3n04HrAIN43V9g7na6DliKErpVtudk8R+
         0hUutBCBQ2Ix5zBwkQXwzcsEC7tZtuZZDuGz20CxtJ5hXkL1xaFAHSB4tSB1hK9/JvF3
         wzgwl4vw5cDaMsTJ2HLIQpe2HpPfu+OXp/lUD9TaxDf2XaXjKT2Ytl8fwEVELzpICgHT
         9Xo6PlQ56nZEcR1SZis1STTz92/4H8aeqWiAKCdWVM0+QjPlSA0wlwrGTBgRIVRpo/Vq
         A3AE0hnbjezv1eN3fCEq33Ki5BTSr3qjolzYnLeQVQ5jaCLEbBX2kG0uSDLbTjfJAw5w
         zTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771814631; x=1772419431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ljL4rppbd2e4wqdN+iebDJxhwWgT1e5IA+58B3ERr20=;
        b=NqOmz3HO7yeLvZujYZKaGErec2+W1w9KZzaQ7jrTrpS3Lvibv0IVY+gHCDsv1yAJq/
         wTAUCI0BPT3QK4doWQw9onlReVcSukWDNDHffSpv234L2sEZvWgUIyAgpP/NSsIqXk7X
         a10Rly6OCXRr/jC5Mv8R5MiatQrDsDLpA7bcGzDAfdZWfPLx648ZZCJHiTYyCQY2K3E8
         gtZOYa7+OA78Y/p8l7P0BlGVDZppgnrNPIyN1kg04pT7Qx9oqcT/Mkl/+BzVzQTfi+Kh
         ot1qHrANxMfcffT0hcy0JzHPzBZDj8/trSGsTkQxb/zxzYI7bO9g/R3byKDqZ7gBHm6/
         muHw==
X-Forwarded-Encrypted: i=1; AJvYcCX81Bu2fzOoXl3w9+gtnH6Z8QfnsfA0mfG0JIZ6yMwjQCqsBx0BVIdES7v9P0hOl2TCcG13jN8nupt+N4HMUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZC556D0h8o+o4j95jK65iA8IJYwJegBI479j/Th/MnVeuGCs8
	35nni2LcWdHHzyO1Dg/b+KngrAeNYWTmklN5SZiXnrQ5XXXHPYkB0vi3
X-Gm-Gg: AZuq6aK5bdkp5HuE1O8Ro737vfnTCAdWtMv7125l1IJAJ/ZoE1227XskYA1MHPqvIFt
	1YToBlbsRV7iX4SQhKhnWodF438b+8le8+Q1meivbi3rN9q7LbwYH8pXcgKSjJXX8d9eOaEV20s
	diaa3vEdhLkee4tK5aL8nc5jChYpgYuVthlazaqur9xF87U6ewLmSDo0eaUZLyN8PifGWeb0IEy
	DW+J+2bYH6bD7i+d5PtE6DhB2K1j172nNILnVXigin4WCCMywEmDN3R1xK35PulzbmA+cq85FOP
	a0+xon45r52F1xLBx85O4Jlk4yM2Eq2lq5X9m56dZjosVeAGx+LJZyi+SpKJigbwPzZQejkeVd+
	PhWULVxHoARpSDZ9Xc5fZM1qvlIsI1+RxKfuAHeGuV9qPwlISrJWZhp0yCvz9Iv4bGvuiVrLQR3
	j4nMg66vQYO9qYUapB9sDULIY2JomkwKWuil8Q
X-Received: by 2002:a05:7022:603:b0:119:e56c:18ae with SMTP id a92af1059eb24-1276ad182a5mr2916645c88.22.1771814631240;
        Sun, 22 Feb 2026 18:43:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af204acsm6850708c88.4.2026.02.22.18.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:43:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Feb 2026 18:43:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Masney <bmasney@redhat.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: pic32-wdt: allow driver to be compiled on
 all architectures with COMPILE_TEST
Message-ID: <d4e377f1-022e-447a-b61c-8fd55b3dd92c@roeck-us.net>
References: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
 <20260222-watchdog-pic32-v1-1-a2538aa528d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222-watchdog-pic32-v1-1-a2538aa528d1@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4959-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0913417177B
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 06:24:16PM -0500, Brian Masney wrote:
> This driver currently only supports builds against a PIC32 target, or
> with COMPILE_TEST on MIPS. Now that commit 5aa5879eeebb ("watchdog:
> pic32-wdt: update include to use pic32.h from platform_data") is merged,
> it's possible to compile this driver on other architectures.
> 
> To avoid future breakage of this driver in the future, let's update the
> Kconfig so that it can be built with COMPILE_TEST enabled on all
> architectures.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ec20bb80bdd5eb9b4852ffc8150e7999a42f7635 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -2011,7 +2011,7 @@ config MT7621_WDT
>  config PIC32_WDT
>  	tristate "Microchip PIC32 hardware watchdog"
>  	select WATCHDOG_CORE
> -	depends on MACH_PIC32 || (MIPS && COMPILE_TEST)
> +	depends on MACH_PIC32 || COMPILE_TEST
>  	help
>  	  Watchdog driver for the built in watchdog hardware in a PIC32.
>  
> 
> -- 
> 2.53.0
> 

