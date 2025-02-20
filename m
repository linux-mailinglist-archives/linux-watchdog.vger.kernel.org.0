Return-Path: <linux-watchdog+bounces-2977-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DFA3D65C
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 11:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5533ABFF6
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6AE1F0E45;
	Thu, 20 Feb 2025 10:20:49 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FB1F0E31;
	Thu, 20 Feb 2025 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046849; cv=none; b=TFmYcvSORPmVl1i1aVEz3R9DPSQJC0rhcXVaDMREqqUOvBQSswsY3QjQ8fak4Fs4VtK7B50FyOtQjx8JgT9p0WurXbSLFrd3mNBhQ+caGYJZ5MLbmS9uj4uYuWk/iKAhqe2YpH3PeC4nZ0opQJ2iuuZEFcZVwKm4h03SyawP5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046849; c=relaxed/simple;
	bh=nCeQIw1a3GqsNvMn90yy9cyPFUOXcIp/ujdvMKH5Dzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3sIcApIq6b6cLkWraUbPCjW17aYpetQdwVmpO9ddAtweQq4qrajjNWDHE+Wc7Uhd5YSuawwupGvYrrE7HttvRhwc0s/1OKgn9TskuucWtaIbCcBxZa6fHbJFNQBT4SVtkGMt51NKriV0j86fH+iwXe7WzvNowa8uRYsEskExiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86718541914so994461241.1;
        Thu, 20 Feb 2025 02:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046845; x=1740651645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFhQ4zThibh1VhI4YsM0iMP4aCetSZWu8NKgm6e6W0s=;
        b=Qq6U6FWhps8UNpbjSiEMnSNGFvuZHRQ51T/R6Iqf+73G7+LnxpkgU9Uts0yTA/ZTpF
         TEdC8EA3AgZF1vB26zJv9t8+nd2ZFD4hhHl06NkW6xeOhxATyF6A6qR+gp8xOkqMMRTx
         R2lt+KQLy/QJSlVTAAlLpoEdAPsuz1oGftcasZXF+abOvcp9Q4AS24VCPL/ON4ArpSag
         g7i4/EpdcR46JQAJBynwep2sOZ2HeNAy2IrLi2215+0bUkHRA3O9utWEkXwAp/XZMejT
         Gcu+nLVMZdmSos+DLulvrft5yqndcG0fI6rvddB8/veqQhas1r33tUfQ84Kck3ea8DL5
         zpXg==
X-Forwarded-Encrypted: i=1; AJvYcCUBQESbwE55KgD0IAILF+U8PBzRa1Ybmg7ssTD3fsEI1OTBn4BtGaE9OEPOLpjkNhznAE+u3p80fo+B@vger.kernel.org, AJvYcCVoTFXo760vq++RFhopeJWXhFPFQ4ZenawO+ktDeU7E5qcGA0kUYmQz5VDNHQrNuHCeJlIwjbzAYqjmHRlyx6w=@vger.kernel.org, AJvYcCW0ShFMCx3FTaEsw5S8SCIdol34oNi0cWmUKRyDOiIxdh+Sjw3BMIzFuuzyMoGzsSbKalYMaTiEkgJX@vger.kernel.org, AJvYcCWdJuId8q4727JVSJTII+A05W5K5H0NE3oaYT7RM46aPCyIQW//+oVXHH54HcRpjz2j8nzd5HIwnfdBMb4g99dq5iA=@vger.kernel.org, AJvYcCWkGfepUvj9aPF6tlFjWtXIFbhBHVWTaC6MLHuH67gRuJTdIG159//CQe7IYDEhiGLq11u0x4+IddhrB9gy@vger.kernel.org
X-Gm-Message-State: AOJu0YydOSOZSKVkm+XpeUOckFgtBQ6PWFIdAdi5KXkEf5k4onHt/p9w
	oYKgpQcITST8MQM3QiInLPvPpxcHuFtQj8K4sFSn6s1IOIZvSJ6tnYBkUFTZ
X-Gm-Gg: ASbGncuJhV+wuuOrI5xLFkKJAwyXu/88gyEJHmmT/Jf4l8kE+/wMo+7H0GkvDFbwxt0
	R8dPYqc91hIr5/2l1cMIX5WrD4Z5iGgCV94ML4cr+1HBj301pJmQWE1KL4YDVETmSqXY++FfqsW
	tdseu/IOTB2AFBcMs/GeZhRDO6Tz6Jfpy6ADUr2nOrQcnWNNPvto0mBO+ezSHdtouphyHyIISZ9
	MfRleihj1ulhRxgCJDGoe66IQQxMHdSGyO8Tj2bKitAUyxQxcrgv7s74KxY/beqnBROaNtWg3HC
	lMJluJvTTS1rN8RpmSS48wH+7M97xVaaeRq0X99TiTdjo0+vmUrh8Q==
X-Google-Smtp-Source: AGHT+IG4hLjmH1yRK63PnrEV4NX2BuRdzUhAcEbdxxgq2RV2rQo9bH3vkHnssAgNf7A6+g3GdPaeDg==
X-Received: by 2002:a05:6102:5487:b0:4b2:9eee:666e with SMTP id ada2fe7eead31-4be99139d9bmr1213912137.4.1740046845207;
        Thu, 20 Feb 2025 02:20:45 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bfb6291739sm105858137.2.2025.02.20.02.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:20:44 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4b9486a15a0so1149829137.0;
        Thu, 20 Feb 2025 02:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtrZduQNktVEjZ9xYci95jzHSIFSR5CdU8p9dzZRuCY4p61K/VhsMAA6ad6OsBf/7Y9il+lFueKi3u@vger.kernel.org, AJvYcCVmNw+yF4QAuAxnC3z9bjvZnGdmnNN3xXUYzLxhcgdkHb2dNbbeyDJPIRyXxqD1MSyheqeQyiYnGZkiH8Av7Y8=@vger.kernel.org, AJvYcCVwFTERDK2BXLCUVJZeNU9RqKP4LZakA04LceGLK5TUhYdMQmwQFupbppjBNmMnr3WH7+vv6URMrFwGVIJq@vger.kernel.org, AJvYcCW8Ei6LMCEAUrlEPk8KzrN3lviOz4urHf4xiYJZt2CUkrekU/qGmLUxWxXkxjbgnzpCQgurJc8lvYmyDP2A3F23XEo=@vger.kernel.org, AJvYcCXEivZY5Vz3BPR0VREUKyBytjNLJ8FVHsf7UB/u8RsozzFN2PYhAe0VNC55MozMTcBGyCYS+BpEj+Lh@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:4bc:2f67:f348 with SMTP id
 ada2fe7eead31-4be99123ea5mr1374985137.6.1740046844391; Thu, 20 Feb 2025
 02:20:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250210184910.161780-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250210184910.161780-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 11:20:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb_dT3j8YcHWbzsYVPycq_gmA8Wh+ddTd6QdMBg01FHg@mail.gmail.com>
X-Gm-Features: AWEUYZmB260fpyDdlTmFaPRzACzpTDwfXSEw8kB_8J6jvNhWLQhz013pT4c5rec
Message-ID: <CAMuHMdWb_dT3j8YcHWbzsYVPycq_gmA8Wh+ddTd6QdMBg01FHg@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] watchdog: rzv2h_wdt: Configure CPG_ERRORRST_SEL2 register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 10 Feb 2025 at 19:49, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Currently, the watchdog driver relies on TF-A/U-Boot to configure the
> `CPG_ERRORRST_SEL2` register. This register must be set correctly to
> ensure a reset request is issued upon watchdog timer (WDT) underflow.
>
> Now that the driver has access to the `syscon` handle for CPG, configure
> `CPG_ERRORRST_SEL2` directly instead of depending on firmware. This
> improves robustness by ensuring the required configuration is applied
> within the driver itself.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

IMHO doing it in the firmware stack is actually a good thing, as the
watchdog policy is system-wide, and thus goes beyond Linux running on
the application cores.

That is also the reason why commit 76b1c5b218f31811 ("[TEST] soc:
renesas: rcar-rst: Enable WDT reset on early R-Car V4M") is only
part of renesas-drivers[1], and not planned for upstream.  The sole
exception on modern R-Car is R-Car V3U, cfr. commit cb9a39aacd3d6387
("soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U")[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-drivers-2025-02-18-v6.14-rc3&id=76b1c5b218f31811a7aaca588d3ec4ba584b7bf2
[2] https://elixir.bootlin.com/linux/v6.13.3/source/drivers/soc/renesas/rcar-rst.c#L76

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

