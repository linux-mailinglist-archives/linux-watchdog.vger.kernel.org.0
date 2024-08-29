Return-Path: <linux-watchdog+bounces-1616-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C99640EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 12:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C83EB2168D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 10:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1856118CBE5;
	Thu, 29 Aug 2024 10:07:58 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DD4A00;
	Thu, 29 Aug 2024 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926078; cv=none; b=RaMplrminwsqtRyH0m2n34yQBPZ0fp4J0a+v/tawxOtXlQz2SrzwlQHam0phV2F7Bg4pNXNOavZPNTMHGCQ47vUDoyllV8/tregoBAH9ttKHF//jlRHW7Q8hXqxDnuzKghGuAI+18vOs8YD6QVS+lH73RkWhz26MuQaoRKHeZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926078; c=relaxed/simple;
	bh=34SMnDpz2sOkKhVTCiD5hAHJS3njg+Xu9HXU10mjVNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npj89V/+VGGqR2n+/z4swg8Y4ARzfvRHHLmEj8BWL/icL+h/fZSoqqkcAyW7TdRVqxKcxUcjTMujnF8aJrDtY0yfXox496blaYcv7L4XjOPMn6tCRKPS6d8a/fIpzb/ZNgSPbmZtZTmCEu5xOq2DaSdG53ZB9kW6NJq/KVIVQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6b4432b541aso4871547b3.1;
        Thu, 29 Aug 2024 03:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926074; x=1725530874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agM2uieBOGDHR7oA4CvBCTPuHqTNsiUN2AfPhgc69q4=;
        b=jmB8nnmKooN9CaFD67ul6wZPap/iNPRd270zqJIpcaqFw36LtftVHbIilm4oLO0Wdp
         cXckJP7pM5d3tN5Mai/927hvQXeAHlP24/Qj8oIuaUXo9EvgU40c+L93ReAhW9dNM0vF
         38zWan2/k/5EgP3YbrN6AeD4vL1nsTHbtb+4E3XyI34YK0dLWIQ4EtasQBUb5u4vPO1z
         urkLOzDlJ7nhK5y8Pt/N1EHMVoM5J1I/OIi1vg2BrxzVcU+DZUbRA04DNxPB4FpVr545
         5uFWvEUa7TLX539dQpNCDPXjqdlB+CG2eeHYr9Kc/VDLtDtQahUI2u8ydBaip29Cy/Fd
         iZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUSuIYQ0LUfKVDnf+3VEgC+6NhkwTTS1s25wNpeCnW/FeXnncOxv7tmMvv99EW2+gBvAPkodKHJeUU6cXyE@vger.kernel.org, AJvYcCUnGRLwtF1e2iyseCbGcuNnohZtYOSM0UUvTHKIAOI/xlPVxdgGhqHgtpaE3DQLrnZ4RWb7TRsEdDYt@vger.kernel.org, AJvYcCV2Xn+wdECbPTB8RZhUlpop8wpRxyT52DRgxoMQxvualSqD36+bp9LoW/4sj80cchYxYqaE1LXXsIUE/n9yLyo=@vger.kernel.org, AJvYcCW4r0uT1/szO8XgzKf+FyUQG0jdIBV25Sku7yy9OkO4JGg/URNlgnKBM+dJKEqnIrRMjzKvFqBO3HfwmUfWxzs5EEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/RPticklKb67yqT9TJRAdqU6pRmOyEGkyjzF0ozJIeDmHo1Q
	KwylGFdMPFzrJCj6mE/Fi9zK2AhclCLXG2II+M9w3FwqxX55jOhBWIZZOduk
X-Google-Smtp-Source: AGHT+IGpGMFWeVqqx+ZaqEkEnBkoAa8xh12uYIUlSBhuIZoCsK6tepIXrfrEQHnONZNLDe2HO5Qc0Q==
X-Received: by 2002:a05:690c:6509:b0:6b2:1b65:4c0d with SMTP id 00721157ae682-6d276404956mr24390297b3.10.1724926074375;
        Thu, 29 Aug 2024 03:07:54 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d39c72c1sm1783607b3.24.2024.08.29.03.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:07:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b4432b541aso4871407b3.1;
        Thu, 29 Aug 2024 03:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULIosyf1XranRO/NecnPwrnDNAFIb+04W0nwTu8BwqNJ5TfbE+8phQ08Iprn5rAcycZa8cY14X42VTl0EJlofXEvY=@vger.kernel.org, AJvYcCV7j+ma8k4eaAEJZ/Tsp0Gz1xyX0eJdQ2qDP2r0MqsI8NE/6rxpZ83RrEcA7bGHxNxE6iQ0PEFsaY5HL21Xyvg=@vger.kernel.org, AJvYcCVf+99xgukgvRBuPdWO5ZwW/sDe6BGLonWF6uNt/42/6/c4v7ZdAzi3qgXF7NvVxY5QvQ4qVWSJE+zC@vger.kernel.org, AJvYcCW8U1XxxS3vPkPaqiseGmk+m3t31Mk9L/8J0l+ludtmOWpIkTJAyXy2XbSnWYBPdBqtJK73yf1AcKMF6ttQ@vger.kernel.org
X-Received: by 2002:a05:690c:10c:b0:6c1:4068:cd45 with SMTP id
 00721157ae682-6d27804aeb9mr20404287b3.38.1724926073635; Thu, 29 Aug 2024
 03:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240806210623.183842-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240806210623.183842-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:07:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUW8FjgNb9J4hsfZOk3EbXMmihemm2BkO4pLAaZ-QGNiw@mail.gmail.com>
Message-ID: <CAMuHMdUW8FjgNb9J4hsfZOk3EbXMmihemm2BkO4pLAaZ-QGNiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: renesas,wdt: Document
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, Aug 6, 2024 at 11:06=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the Watchdog Timer (WDT) hardware found in the Renesas
> RZ/V2H(P) SoC to the `renesas,wdt` device tree bindings. The RZ/V2H(P)
> SoC features a WDT that is compatible with existing Renesas watchdog
> drivers.

Your patch "watchdog: Add Watchdog Timer driver for RZ/V2H(P)"
contradicts the last sentence, so please drop the latter.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

