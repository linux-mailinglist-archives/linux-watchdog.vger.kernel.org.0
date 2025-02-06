Return-Path: <linux-watchdog+bounces-2840-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC5A2A5A4
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 11:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77B907A2DC8
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49876226558;
	Thu,  6 Feb 2025 10:14:45 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EF225A44;
	Thu,  6 Feb 2025 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836885; cv=none; b=lVwcuTJo3eF/2I4O3/JDNM4lF6MFLAtdkY+QJVgEQNVB5WSd/ls92SC+iHhjGS10CKMqOFoXR/GzHakNNlxJTZeBv5ycnm4nahP62Utuba5zcTD+hdXnAM6+4B64YcmER+estDI5caSfvm3FwJCU8fGNstrA7kLlZQllwqJ89LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836885; c=relaxed/simple;
	bh=pROxy4pf04TXH7Mq5LQ2jLXo6EmggJFwNOEavqeCF80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu5nV6mG/AxOp+Eq0nMQdFYyrgiEPNyDWoIzrGXs7tY8NWdxo/aWPPSUf94N4GxTbNAuaiRAU6I6w1QWN43g56PxbEsqZ2nF/00ORWVHzSZR+jIW5one9Yq3EvfSeOyyqYQ5PVxr4FAsb9WOxVtE5v4p07AOzepz3qefxOf4/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-303548a933aso6131791fa.3;
        Thu, 06 Feb 2025 02:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836879; x=1739441679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2/IIP3n3Vq0jAraoBBXavMXEaBuRqCM8Y1vyh7jgZo=;
        b=gV1reWNqoVGjOnFarerprx/7rzZe4b/Ohvrvl1bomsY7d5JguiJuTEHSE5IlQUqjF+
         GfeADunoGmxh2wgce6iPBmK2XYKBTiGHWAbqwxlYzWmkmpG5L7a4XZSkBL/BqZbuw7xM
         Pf5JI/VLSy5Izoohpnvn8y8qpNazQvcbpIhzhmtpfWI99f1HMujnaFgANe5cqA0u5dBd
         pvVCHENCKhzM75Lbib8Z6Dj+PB4alzTihjcMuFMgaLcGNDXoTRn+95rgZ7xRVz88fhzh
         HsENaPhAshmqNFvNi+MSfjwsfHnfuBH+23PLDXsz/tApJRakIU/elr3GfFJWTgGcNbvg
         BjFA==
X-Forwarded-Encrypted: i=1; AJvYcCVOTVncA9HLm3DDUWi5Uew+GWGrCy0K+26Ua+TMnmg/BkT5eivdIfYRzH9hXXcCAAvrM/pdcbjSGzVCd7w=@vger.kernel.org, AJvYcCVXinWQK2B0OrQHXvh0OMtSG3UikJ2FVHgXFhGqqpMn9nQQpmp1anhaRanCieLoUHTsIKwRRf7c7sNeNQHRENo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCBgDDquq6KOqdl282EgI6D/wRFIdbZ6dW/0IkgUdby/L3W5c
	hm6r4d7mhWksrmHhc9G96BqyWh/lcbZ70EsKZx52ztm5dKKjlfIviDy621pY
X-Gm-Gg: ASbGncutl0ZSgY1Kk4NUyMkp3iU1q9fJq9tifuxCX1LOgIAFyqPhSoqzpy5cuH8G0+5
	feC9dMCyd98TReqO53U5F8svEewLBq1RyUM69ypTqZD8OATuPhLL/SQmekIApOImhfi9hWzS5og
	1FV/uQls7xflmCuxHz+ppr3UZVZC4iK7UqadbnLWMRRx8wIRjlvCJWpy+eJwdj/fOxwAdO/XQVM
	M9g9OD/e/CCTQrm+Li+AGuy/kK01yp+O93ZqPsTM8E/srpbMge6DuU/PzqKUefDzgT1tOa6xmiO
	oElNEWFgFugbqnanFdOF+0XgtMZtUpx5tGH4hySZaadhetNi
X-Google-Smtp-Source: AGHT+IH5d/WuzAh1P+qwDxSs6bVKU0DlssLlQn8zsNWvkQaXTwAJfrkrn3entI26sNeVTAH4+8S/Pg==
X-Received: by 2002:a05:651c:1149:b0:300:33b1:f0cc with SMTP id 38308e7fff4ca-307cf38ad62mr28196761fa.34.1738836879285;
        Thu, 06 Feb 2025 02:14:39 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de190915sm943221fa.40.2025.02.06.02.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a59so7851831fa.0;
        Thu, 06 Feb 2025 02:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlLxBx/ostG5YOFIk3WB1K94gL1VTk670GgWLcWOHpFESaufHVmi1aNKaatvZE6gSkABZLNSR3a7mXb1MQ8gE=@vger.kernel.org, AJvYcCXxplkiFxcEFqAZE2xGj47uRoAuJ42b2OSedcu6hFkmOKkSpwCYLpLikpT5DxBYzrIju24HKmbQ0qK1pYU=@vger.kernel.org
X-Received: by 2002:a2e:a912:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-307cf2ecc76mr23979521fa.4.1738836878292;
 Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206093956.46593-1-regis.dargent@gmail.com>
In-Reply-To: <20250206093956.46593-1-regis.dargent@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Feb 2025 18:14:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
X-Gm-Features: AWEUYZlm4gSn7cw1IB1gbPXGlwF-pdLLAGIdGOws-wlbxjHAlekI14cTphPxU20
Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
Subject: Re: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
To: Regis Dargent <regis.dargent@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:

Please format your commit subject correctly. See previous commits for
examples.

Please provide a commit message including justification for the change.
The message below already makes sense, though it could be made more
concise.

Please also include your Signed-off-by.

> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.

                                                           ^ appropriate

Please wrap your messages under 80 characters per line.

>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)

Make it return bool.

> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);

          return !!(reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);

Maybe also read back the current timeout? This should be done after
watchdog_init_timeout(), so ...

> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }

... you should just combine the if-else block with the one below.

>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);

FWIW this is what the dw_wdt driver does as well.


Thanks
ChenYu

>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:
>
> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.
>
>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }
>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
>
>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>

