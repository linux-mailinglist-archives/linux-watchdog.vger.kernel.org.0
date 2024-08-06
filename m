Return-Path: <linux-watchdog+bounces-1458-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D49494CA
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 17:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1521C21744
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 15:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFFA364BA;
	Tue,  6 Aug 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKdqKCfj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A225621105;
	Tue,  6 Aug 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959312; cv=none; b=DxjwOzwUfEaBZlxFMv7NTq6coyPuk8f3oFmr1gaOijC2xQQ0VZy88vsB8K7DynqM901Zp0KgCkUH8oaSkmVA2zkou1ST28kRw9iraf+JjrIFEA4CHXkwZVRaZf0bEI9Sj8ZGpr1OzHVTuZhkDbv5ovh2WZRw49i56AzLwSc6WVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959312; c=relaxed/simple;
	bh=5kw9LUCe3aMCuSe3G3ahOANLyecKLgyvijitJU7k30c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luAwIH98mJtWjoEiWM3VFMq7aYokAVBhkqvDSNAUN0ACD3+VgBC9v2D85dS0O+LYspLK8YU99JU9OAdJsQY2PdmwFTP3nsHnKBwf81v+1FMgbHtzH6NkELtBPU+CaT3CJutKQMpAKHYPkj51Vux0lDFCAP66pU5bUIF2Wo5sEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKdqKCfj; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-450059a25b9so8254851cf.0;
        Tue, 06 Aug 2024 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722959309; x=1723564109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebRpBwJcWZCPuxZmfUOMbhoCEFcgWL5zqoZAend3/rg=;
        b=RKdqKCfjeIT/atDffyumtgfjRkOl85STAjVpRM9Ou54q+CYH9NSO9hb9JKhBAvKGIs
         bLDlCQ45vM0q0jMaeGwPGPRkh1+qVQ3kVR5Fvpet9g3Wc1cXqdlkt/Auy11dPHFmD2Z8
         syvk+WCzELCUqtGvdcPLQ8F3xsUnXm5JUfEkhlz4P33fvtmZruToFnxc3WhT1qrY2KQr
         Fw2OISoa6A6nzbv8KGeG3qr/7UHp6eJbtvPqf4eBz2w5QFe2sdKKk9m3Z1aVmwQ5WCfE
         AnRR8u2AijUU9VaKwE8F+sAMks2k95AwuPlBDCrCA2j1x8NAIy96Qoldn7Oix3grsOrR
         XgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722959309; x=1723564109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebRpBwJcWZCPuxZmfUOMbhoCEFcgWL5zqoZAend3/rg=;
        b=BDk6W5FZ5QTagnT9775o9D+NbzeDEtC6KW4JDazKC/k3FFzjFN0/e+V6oo+hW+jfs6
         H9RYUtGYPO+IL45eUSadTPEKuVXKROL7Aey5lSV+76MZp88z5uoTJhi4p+S/vxvqn4ba
         4+UV3tu89GA9fF83rMmHyRqm7rp1OA9oamGmyJPOg1telDCgJ+fPb749kJ7S5y9p/F3v
         VSJgDN283s3zusVscvqmBZmZcvljfGpSBWRSJ0SoEIYhJxEbhes3QY90ULuMiof2Bv45
         x7vJlYswkYCynEaASgamHpm2+c6q8uFJyAf76RUwjy17gm3l4c00pFXZsr9+6hLqnAMK
         0blA==
X-Forwarded-Encrypted: i=1; AJvYcCWDPmeNl4mlMjmJRK9r62OZfqnqwNzMKf+mk1G518Iy34nnVphEGvuKhdiFnR0DWEfNtzWTLQA54xrSWmI1k3HoqxLja9OS9zK+AgKhIArufUM2hId1chZoDVn3m4xPtjA9xrltWmAdIrAEAxDmDNHz2LMRaoGuf28EXfkmdhpAdSaYK96h92GB0sXZs7mBfUhfX8U0KjL6ty4n9FFeUUjyhn7PyAiNX16Bu4Q=
X-Gm-Message-State: AOJu0Yz7DS9SM/wZ9hH7m1mpQnHr0EBSrESO3dvf2t76/UNjb28PufrM
	Xo5IKFK2P+IiXD8BfAU4WjthzN5TDUF842wSYxz+WSvdrdybbhH2/souAeO7GK4dAPsm9xdrLLV
	1wFobccglT15T99S9RRjwHqC1D9U=
X-Google-Smtp-Source: AGHT+IGq0AW13T1iMnr8QI8qtGbWivM8zKHtCkVchJ5WVkWb7ImghZpbduhEbct+4umxMJZBc0nnwLmQXU1QtCkMlig=
X-Received: by 2002:a05:622a:164c:b0:447:f8b1:aeb9 with SMTP id
 d75a77b69052e-4518454fdc8mr327544871cf.16.1722959309454; Tue, 06 Aug 2024
 08:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805200400.54267-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240805200400.54267-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <81ac76eb-8b43-457b-80be-c588ac4790e1@roeck-us.net> <CA+V-a8u0dFGmNqJWuXXH3mVVTT6dWBhSr+SM7nFyu3DAeACjNA@mail.gmail.com>
 <45d4760e-17bf-49f2-a139-d79a0202b630@roeck-us.net>
In-Reply-To: <45d4760e-17bf-49f2-a139-d79a0202b630@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Aug 2024 16:48:02 +0100
Message-ID: <CA+V-a8sn0R3Vd7JFzitSKm24KzKUNdMf9SkFHn567X6y6nA-eg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/V2H(P)
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Tue, Aug 6, 2024 at 3:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/6/24 06:47, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> ...
> >>> +     /*
> >>> +      * WDTCR
> >>> +      * - CKS[7:4] - Clock Division Ratio Select - 0101b: oscclk/256
> >>> +      * - RPSS[13:12] - Window Start Position Select - 11b: 100%
> >>> +      * - RPES[9:8] - Window End Position Select - 11b: 0%
> >>> +      * - TOPS[1:0] - Timeout Period Select - 11b: 16384 cycles (3FF=
Fh)
> >>> +      */
> >>> +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_256 | WDTCR_RPSS_100 |
> >>> +                     WDTCR_RPES_0 | WDTCR_TOPS_16384);
> >>> +
> >>> +     rzv2h_wdt_ping(wdev);
> >>> +
> >>
> >> The need to ping the watchdog immediately after enabling it is unusual=
.
> >> Please explain.
> >>
> > The down counting operation starts only after the ping operation, so
> > after starting the wdt a ping is issued here.
> >
>
> Please add that as comment to the code.
>
Sure, I will add the below comment:

    /*
     * Down counting starts after writing the sequence 00h -> FFh to the
     * WDTRR register. Hence, call the ping operation after loading the cou=
nter
     */

> ...
>
> > Ive now updated restart with below, so that we dont touch clocks if
> > they are already ON,
> >
> >      if (!watchdog_active(wdev)) {
> >          ret =3D clk_enable(priv->pclk);
> >          if (ret)
> >              return ret;
> >
> >          ret =3D clk_enable(priv->oscclk);
> >          if (ret) {
> >              clk_disable(priv->pclk);
> >              return ret;
> >          }
> >      }
> >
> >      if (!watchdog_active(wdev))
> >          ret =3D reset_control_deassert(priv->rstc);
> >      else
> >          ret =3D reset_control_reset(priv->rstc);
>
> Please rearrange to only require a single "if (!watchdog_active())".
> Also, please add a comment explaining the need for calling
> reset_control_reset() if the watchdog is active.
>
Sure I will rearrange the code and add the below comment on why reset
operation is required when wdt is active,

        /*
         * Writing to the WDT Control Register (WDTCR) or WDT Reset
         * Control Register (WDTRCR) is possible once between the
         * release from the reset state and the first refresh operation.
         * so issue a reset if watchdog is active.
         * Therefore, issue a reset if the watchdog is active.
         */


> >      if (ret) {
> >          clk_disable(priv->oscclk);
> >          clk_disable(priv->pclk);
> >          return ret;
> >      }
> >
> >      /* delay to handle clock halt after de-assert operation */
> >      udelay(3);
> >
> >
> >>> +     /*
> >>> +      * WDTCR
> >>> +      * - CKS[7:4] - Clock Division Ratio Select - 0000b: oscclk/1
> >>> +      * - RPSS[13:12] - Window Start Position Select - 00b: 25%
> >>> +      * - RPES[9:8] - Window End Position Select - 00b: 75%
> >>> +      * - TOPS[1:0] - Timeout Period Select - 00b: 1024 cycles (03FF=
h)
> >>> +      */
> >>> +     rzv2h_wdt_setup(wdev, WDTCR_CKS_CLK_1 | WDTCR_RPSS_25 |
> >>> +                     WDTCR_RPES_75 | WDTCR_TOPS_1024);
> >>> +     rzv2h_wdt_ping(wdev);
> >>> +
> >> Why is the ping here necessary ?
> >>
> > The down counting starts after the refresh operation, hence the WDT is =
pinged.
> >
>
> Should be covered with the explanation in rzv2h_wdt_start().
>
OK

Cheers,
Prabhakar

