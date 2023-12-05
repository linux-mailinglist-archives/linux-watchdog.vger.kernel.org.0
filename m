Return-Path: <linux-watchdog+bounces-126-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8C804C7A
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 09:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365861C20BA6
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 08:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BB212E60;
	Tue,  5 Dec 2023 08:34:10 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69065185;
	Tue,  5 Dec 2023 00:34:07 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59b5484fbe6so61188337b3.1;
        Tue, 05 Dec 2023 00:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765246; x=1702370046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCC9dgHmyasaCrcNxfdU/Q1KMGuxj2gAnILOurzZajU=;
        b=nxMChfZy5ZDfKAArPE8HqwTXEha/rk50GGjqLIlk9uOfMLSmyyvMS+EbHh6r3l5IVv
         LwXfZdeD0YEEmpUFPnFTwJ4VGYDFJK0/ve4qLAjz5XhRuhha5l0F44olDf4wQSjgrBlv
         SxPQ6BsYlWKaWlwatcruQXPEJEP3g+tddzMxWq707Zaq3DZCoNlRLNGkNfNfj6wR2FNc
         qFNw+CtFoCgdmrmLW40u0PQf97qUjEnLoIukLacoV0tU+JlSLpy1ElvL2qA9aUYU/HwW
         aQHxQsukC9idNYipb5AR5hhPdUX56L/Q+wW+ulvSGQCP62UzPVWaZAv7SBd3l03ANmRw
         93OQ==
X-Gm-Message-State: AOJu0YxIQrpFo5okiiRnr9RQf6npw+IQd1a+pX/Vke5z8/o1WTZrjSlR
	jowS5WND6+DJAeSKWJPHpK9vaYk9MGgNxw==
X-Google-Smtp-Source: AGHT+IFr9wp40z7tz6vpgIWB5NyP4X8v15SAId0Qrv/6gD6GusCkP9zn5MPIpgVc+mdKon3O+J0S+w==
X-Received: by 2002:a81:98cc:0:b0:5d7:1940:b39b with SMTP id p195-20020a8198cc000000b005d71940b39bmr4370180ywg.103.1701765246273;
        Tue, 05 Dec 2023 00:34:06 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id n81-20020a817254000000b005d76007799bsm2396127ywc.141.2023.12.05.00.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 00:34:05 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d2d0661a8dso61162877b3.2;
        Tue, 05 Dec 2023 00:34:05 -0800 (PST)
X-Received: by 2002:a0d:d40c:0:b0:5d7:1940:b38e with SMTP id
 w12-20020a0dd40c000000b005d71940b38emr4926807ywd.90.1701765244916; Tue, 05
 Dec 2023 00:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com> <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 09:33:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOa_1EGERWXhbsxY-RxLgv+6As=XOLzZSkq+d1KMRG1A@mail.gmail.com>
Message-ID: <CAMuHMdUOa_1EGERWXhbsxY-RxLgv+6As=XOLzZSkq+d1KMRG1A@mail.gmail.com>
Subject: Re: [PATCH v3.1 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 6:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> are required. The fallback compatible string "dlg,da9062-watchdog" will b=
e
> used on DA9061 watchdog.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v3.1:
>  * Dropped comment for d9061 watchdog fallback.
>  * Replaced enum->const for dlg,da9061-watchdog and its fallback.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

