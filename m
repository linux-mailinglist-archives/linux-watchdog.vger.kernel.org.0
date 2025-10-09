Return-Path: <linux-watchdog+bounces-4368-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9BBC92C9
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 15:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD7A19E825C
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 13:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D260011713;
	Thu,  9 Oct 2025 13:04:14 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755C2E2F13
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015054; cv=none; b=JGFmlB5w9NU0QSlJJy2DJguvI2nA6zBDHsd7ItwOfYw9FdIJO1BAOoZC9CCXcAW7BXU8w8+fdZuXumeyyZYE5aPr4umQAAXe4VVrnPxRCj2AxT18r+6wF8JORg3Wqq0QI621sjcIR1bzafz+u6QARHA6PfOxPNVfgkiWF+2858Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015054; c=relaxed/simple;
	bh=lK0YRiXmrbwdKZ8P7SUBMaJw3qsSLA898PoG0gyE2ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7GxXZEdGdRuVqKZ+CDftSx2VNdTnhJMaS2DAuKokVTf6vnzu1PiNwextqs6P3jQnmQ91swI/MvJWf8SLVYD/3gzF48yPma1hnRG+QxvFBjHM3rR7Trz8PzA3J+b+0osOqVw5z34ZmeOU14n0NfHXtpC9rwaXQH/CBHANehHxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-528d157a48cso713410137.0
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015051; x=1760619851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F57hbkLvypADnVAMcMK58RQc/+BVGtUmwttvCSfbYq0=;
        b=u834nEBPAuUWAVdhCekdFTP22LRF+KzXlu5CYn6fTzwVR44M03AwOdGQrjnHuY/UWs
         tTyOQnjdqvMvu6DFgW4KgQVEr/jLLhbV6DDD0sHjJ9tnFM5lvVeDgtKBpto1ewa3Ru00
         DcGTgCpebyS3EqJiVwPKYmSd2UHoatxFhtWP0Lr7s2c5YAzNngl5aCsUBqWjuqbOld7f
         3PgDLqBXZ+xkTSPnYBu71ULzexJYpp5EiJLS9fuRdGu/AMA7o/7Bw7sgstS8n+3GZj82
         gt1mbUdIDfMIgLnHa9MBphCAYVkqgBb60eKePJ6Sx/4AOqzraSvtrA0J+d69nhggaY88
         1fnw==
X-Forwarded-Encrypted: i=1; AJvYcCW68EVJ082jHnKMOLy4gva8m9ippV+0JB2bykzkEXmM19kNtasjfuI4U5B9qF585aYos0cg+m2jfyOEeJbbNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKiES6EHwxdv6hHfZ3ky9wQXvxnd2/aorTsvWF5TROL0N4beX
	t/HLAlrUXP92LezmIwOQKVr/VJHjiDwp2DUuZ+NyNrzs6hqTzW0pGfF6vMQvH+oT
X-Gm-Gg: ASbGncuvyCpaP8BPgJCTVz+mU/yWA1jd8UNfk4IwiEtK/bV2xGMkzFuF8iN+UBTpB2D
	hEnpKlDxJjBWJJF5gLvYrALtIBITtBDaLf3kYDx6VapFHcdo4yZ1nId3eIYGtV263cGzjYcWCPA
	+fW46iK/qGsUUfERWAjKiUqJeWO/e+ncNkKXPBOauOVnWjQG61CsNMNmqNo5/9MCtzL/PNZlXQR
	jL3tY6Hh28I79HE3pSetvEVW2SHVhj2Je99W1/Y5QiSgp/oJJ4PThxn0efixcPHtVbPov9jgcu3
	bt1ll8ri9rUV+ablJnBntRRfh2vXFYP27OE8Y9Iv2ADYfLM0Wnzs8v/Hv2fuQ5DdB8rb6dQ9IwJ
	HtG4a8k4hfO4Km2YjVn7cp1fr/JjZzc0Ic4LjQCIJ88h7pVqtt74BYMOa8wTwvr2HKK5HSx06wP
	wxcSyEAt3h
X-Google-Smtp-Source: AGHT+IHcq30/85i3voXNpg9pdzIBjpdLTMJsZQWV1H8MpkG+B8UyV2m2rIPDO330T6iINuACUGo3ZA==
X-Received: by 2002:a05:6102:5c11:b0:5b8:e08f:eb38 with SMTP id ada2fe7eead31-5d5d4ddfb86mr3761701137.14.1760015050792;
        Thu, 09 Oct 2025 06:04:10 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce6430asm5338289e0c.7.2025.10.09.06.04.09
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:04:10 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-528d157a48cso713377137.0
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8c/u1mXYZJ5ZAEGf02/AmrZ2HhDF07axWXx1L9QXjoQfm2AevHn68Luf8d55vFMXKm62omPV6oxYCP3N+Uw==@vger.kernel.org
X-Received: by 2002:a67:eacf:0:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5d5d4d8caeamr3851246137.10.1760015049336; Thu, 09 Oct 2025
 06:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:03:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT5ErgNr=N0VthHf5f0AEAfsfFPWUSmhoy30QjZL=cqw@mail.gmail.com>
X-Gm-Features: AS18NWDUSk9bq9sp_OYBrerwfkIBZEZZxc3nmI1ffEo1gqmpf0UUhuXBoL8iw8E
Message-ID: <CAMuHMdWT5ErgNr=N0VthHf5f0AEAfsfFPWUSmhoy30QjZL=cqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: watchdog: factor out RZ/N1 watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/N1
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * added tags from Geert and Rob (Thanks!)
> * enabled 'timeout-sec' as the WDT core handles larger timeouts for us

Aha, so here is the answer that proves my assumption was wrong ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

