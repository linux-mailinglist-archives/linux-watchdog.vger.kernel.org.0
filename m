Return-Path: <linux-watchdog+bounces-2980-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089AA3E444
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 19:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE933189EE19
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 18:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D3E1C6FE9;
	Thu, 20 Feb 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdSjBnW2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0A62139CE;
	Thu, 20 Feb 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077686; cv=none; b=BDG+wGcYSPTwhn91l7vP38KVx5wi5bIjRQtbYKGP0AfDEyM+dceSdBz4GivOp69ZPHbzVbhPhJeqEIuRamcchOpiXHB92oZ1dcf/60nk9ter+yKXewG2VNBr6mvJhIkQgJkMZJJqIZUIvT8ZJEMAyXwGsPmYiotWW5iz+/pPW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077686; c=relaxed/simple;
	bh=cMDqIV3x7lh6uv9EJP5Tt0+qvfNego5MD8pqPWxIX2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uY75GYR/Qirm6Q1DVPXLdNG0WcYlTHoZeuUOwOyKxyMTnfo3KQF+xixy40FbGPEFhc6FsV3nfyEAMU4BQsA3HaWhxxV+blXEjFyT86IWAQv+b+1uAj49zL1EP3m41h1k5LhNhgQH4I2hRzRcIhsWtQ6jo6G3Concpkf2mQYv6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdSjBnW2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so687591f8f.0;
        Thu, 20 Feb 2025 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740077683; x=1740682483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Oal8utCZ08ILyHyFTz/wIyOgD/RRDeQUzHjyhfMLf8=;
        b=XdSjBnW2jL+iE7J70FTw/dasVfEVj0cXPX3mieH8Q/S5nN//YqUFGmgTntmUTCWY9J
         brCEm0mGKB0yFAl7OFBlHKBNFqCv6R0H6bAqr0u1jFmRro8t5wzDcrWLfrznxNtFe9aB
         fux7mNXrY8WiCghnMNAY9QDTRuRmeONShd/v9A47bsq6CyycpQWR9W7UCWOJfTmvPeZJ
         CgAPdm6TsXY+GK3Xy+M4LI8krovNpUSHEa7DEzhZYjMeGcFzGjz4fl3zyNQGObtuud0C
         SMX1mwi91G9rGGvHlZsBYxYKLRGnKwysMd4ZHNj+sFla4QOq1ThMjSBzuLNV+o4qTuqf
         Lz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740077683; x=1740682483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Oal8utCZ08ILyHyFTz/wIyOgD/RRDeQUzHjyhfMLf8=;
        b=rqnKl8j8KrAiTVtZ3TrcfMz5pTSizdmL1h5E8AJp1ZMhBdHIZRoaZeOjFLQ9eEnIe6
         WH1gtgg1fWi9/XxVwM8wkBUF3FOkhcXzo+w7awTva33rrw4x8ilTxIkq2dT8s8YiZx/+
         IpWIiTylEkna7jBU50MbFHR5L7dTrmZcCKpyjW2jbycTJmoq+DXxtnCFOTfkGDf63B/m
         FdYnetg+tyUK1h//kvedi7KkNM3de/pWZmlEtOZdtzAYda+WNaHZEfsUxLLbiSRFzH8q
         LAth9GTkighxMX8YjyTwEbOWmD0DLEpXhDkwyGBIdvmVMzwWnlqGeZvh3Xcva2fFB7AP
         nmYA==
X-Forwarded-Encrypted: i=1; AJvYcCUyC6ZT+76JVFIyqvSQPnV2ls9NMDWpGE7tl5nXdKbsx+4qNKAbrmKI/6f/uWwytMcZIe0sq9NLcuRJUGs=@vger.kernel.org, AJvYcCV9XuUXP12FRCH1DuP1KbDubgHVhWNBbmvp/iRSEkCTFsgaafzcU7FXwjtbgRar6OZqeY9pXxpqSTWnxrx5+tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhzcR3hsrBqEqrA5hxVKWXGqLMHRZZWrTEsHfiyvViIr+inGu
	P4UuJTzCK63cUQAhZvdtmY+ncxvYLxxzyYtxCs+3ZG1Hy8UtxpTC
X-Gm-Gg: ASbGncsE13BKjDMXaB6Vf+VwllKbsutiQXBgkJXbpAuvOYDAFHr8m/Fkv35cVCgTAwr
	G2hN2clWpZnpLSjxtpX9BukN5H00urgb+OcMsFgU7bvk1RH06gAfNwIOnkDv5Nf3Tj5GI6uTDVO
	AjeIhs+B59d4ECFUQouQOqj3ZxITHJXB5uMWxe7LcZyiBEsRjL4zLRGOhccJhQTjMx03xgBCFuC
	pixgr9w6NOZq1vJyculP7y2eKH3yFKE0KoKu19B5pzNAZ58110jzu6I3zrmleJ1C9vqBBF0a1LY
	SheUtEvY4mHmdhITVZ868E675Q8gl937mx++MteFHPK+jUEXJdl8m2UMQXC/tkj7uew=
X-Google-Smtp-Source: AGHT+IEz1kRSBdQaUNaxSf9Ymu++DD9XiW/gWiIlW5Kf9eF4M/t3Ayol4FGnQYUa8AygEQgkEekRPA==
X-Received: by 2002:a5d:6c68:0:b0:38f:3a89:fdae with SMTP id ffacd0b85a97d-38f6f0d7237mr322996f8f.46.1740077682854;
        Thu, 20 Feb 2025 10:54:42 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dab74sm21637846f8f.32.2025.02.20.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:54:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Regis Dargent <regis.dargent@gmail.com>
Cc: Regis Dargent <regis.dargent@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] watchdog: sunxi_wdt: Allow watchdog to remain enabled after
 probe
Date: Thu, 20 Feb 2025 19:54:41 +0100
Message-ID: <3278560.vfdyTQepKt@jernej-laptop>
In-Reply-To: <20250214112255.97099-2-regis.dargent@gmail.com>
References:
 <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
 <20250214112255.97099-1-regis.dargent@gmail.com>
 <20250214112255.97099-2-regis.dargent@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

please send new versions as separate e-mail thread.

Dne petek, 14. februar 2025 ob 12:22:54 Srednjeevropski standardni =C4=8Das=
 je Regis Dargent napisal(a):
> If the watchdog is already running during probe, let it run on, read its
> configured timeout, and set its status so that it is correctly handled by=
 the
> kernel.
>=20
> Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> ---
>  drivers/watchdog/sunxi_wdt.c | 48 +++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 3 deletions(-)

You should add changelog here.

>=20
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..0094bcd063c5 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_devi=
ce *wdt_dev,
>  		timeout++;
> =20
>  	sunxi_wdt->wdt_dev.timeout =3D timeout;
> +	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms =3D 0;
> =20
>  	reg =3D readl(wdt_base + regs->wdt_mode);
>  	reg &=3D ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_dev=
ice *wdt_dev,
>  	return 0;
>  }
> =20
> +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base =3D sunxi_wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs =3D sunxi_wdt->wdt_regs;
> +	int i;
> +	u32 reg;
> +
> +	reg =3D readl(wdt_base + regs->wdt_mode);
> +	reg >>=3D regs->wdt_timeout_shift;
> +	reg &=3D WDT_TIMEOUT_MASK;
> +
> +	/* Start at 0 which actually means 0.5s */
> +	for (i =3D 0; ((i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] !=3D reg));=
 i++)

Drop parenthesis in condition.

> +		;
> +	if (i =3D=3D 0) {
> +		wdt_dev->timeout =3D 1;
> +		wdt_dev->max_hw_heartbeat_ms =3D 500;
> +	} else {
> +		wdt_dev->timeout =3D i;
> +		wdt_dev->max_hw_heartbeat_ms =3D 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static int sunxi_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev);
> @@ -192,11 +219,22 @@ static int sunxi_wdt_start(struct watchdog_device *=
wdt_dev)
>  	return 0;
>  }
> =20
> +static bool sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +	u32 reg;
> +	void __iomem *wdt_base =3D wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;

Inverse christmas tree.

> +
> +	reg =3D readl(wdt_base + regs->wdt_mode);
> +	return !!(reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>  	.identity	=3D DRV_NAME,
>  	.options	=3D WDIOF_SETTIMEOUT |
>  			  WDIOF_KEEPALIVEPING |
> -			  WDIOF_MAGICCLOSE,
> +			  WDIOF_MAGICCLOSE |
> +			  WDIOF_SETTIMEOUT,

Drop this change. WDIOF_SETTIMEOUT is already defined.

>  };
> =20
>  static const struct watchdog_ops sunxi_wdt_ops =3D {
> @@ -275,8 +313,12 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
> =20
>  	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
> =20
> -	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> -
> +	if (sunxi_wdt_enabled(sunxi_wdt)) {

Also check for IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED). This will
allow user to select behaviour via Kconfig.

Best regards,
Jernej

> +		sunxi_wdt_read_timeout(&sunxi_wdt->wdt_dev);
> +		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +	} else {
> +		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +	}
>  	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>  	err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
>  	if (unlikely(err))
>=20





