Return-Path: <linux-watchdog+bounces-127-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69B804CE1
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 09:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DAC281592
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Dec 2023 08:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B077241E8;
	Tue,  5 Dec 2023 08:47:19 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BE1C0;
	Tue,  5 Dec 2023 00:47:16 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d7692542beso28101717b3.3;
        Tue, 05 Dec 2023 00:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701766035; x=1702370835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESwDfNcl5aY4Q5BZylbxSfmza2kocjWd+J1/KJK9Bxo=;
        b=mdicN5JQiVmQB0Rmz2Tuhsmz+/QEVvTa14CMp2+2Gon3YOZp2FYmAX7bX+CwMld/2e
         CC/cKDCjNbNT2x4BM0D1NyeMK8fWFu24cp+nNmDHK8MYhyWVRUU6EOTCvAWTiuxKZhKI
         JCSfjtDQQqcSvsBmglGe1JmS85Wpc6f41jng67yN//14/JzL5y7OWN5SUSw1r7oY6lk3
         GnSvNUQkiToxieUcF8XeoNs12i4tTKV4rpt9fli2OQv/WD99+joDdmdYmGs8sWgau7H4
         lVdAIw+4f/onA4yvrKv1NqxH6xnCqWWVYu4X3pM9z4UVHYS5KWB31iaIKcgGj4j6PtZN
         7TqQ==
X-Gm-Message-State: AOJu0Yx9ZGyFX6ywCRVnA+9sTA6ZmawqxrS6o/3gmbZImdFgnHZR1ZmV
	CE9ihwZ6m+RLu78FXf3OBgmT3lE/eKBrcw==
X-Google-Smtp-Source: AGHT+IENiQw+4q/1i8eVvFSeTYcN0F+qQ2xSMIiOdHtN+ax4UD0DtM0Bf070EsmAdNGCF6JxRwni2w==
X-Received: by 2002:a05:690c:368a:b0:5d7:17f0:9e53 with SMTP id fu10-20020a05690c368a00b005d717f09e53mr4479075ywb.0.1701766035373;
        Tue, 05 Dec 2023 00:47:15 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id j69-20020a819248000000b005af5ef0687bsm3087556ywg.13.2023.12.05.00.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 00:47:15 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d7692542beso28101557b3.3;
        Tue, 05 Dec 2023 00:47:15 -0800 (PST)
X-Received: by 2002:a81:c94c:0:b0:5da:1bb:b2ad with SMTP id
 c12-20020a81c94c000000b005da01bbb2admr64729ywl.48.1701766034894; Tue, 05 Dec
 2023 00:47:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com> <20231204172510.35041-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231204172510.35041-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 09:47:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1G1iKzsBd8iq0sbKrCvkQ0rSNRBc9v+_mGjyoNqY=cg@mail.gmail.com>
Message-ID: <CAMuHMdV1G1iKzsBd8iq0sbKrCvkQ0rSNRBc9v+_mGjyoNqY=cg@mail.gmail.com>
Subject: Re: [PATCH v3.1 3/8] dt-bindings: watchdog: dlg,da9062-watchdog:
 Document DA9063 watchdog
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Dec 4, 2023 at 6:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Document DA9063 watchdog device as it is similar to DA9062 watchdog.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v3->v3.1:
>  * Added Ack from Conor Dooley.
>  * Updated title DA9062/61->DA906{1,2,3} as it supports DA9063.
>  * Retained Rb tag since the changes are trivial.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml

> @@ -18,6 +18,7 @@ properties:
>        - items:
>            - enum:
>                - dlg,da9062-watchdog
> +              - dlg,da9063-watchdog
>        - items:
>            - const: dlg,da9061-watchdog
>            - const: dlg,da9062-watchdog

This matches the existing usage in DT, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I believe we do have a runtime issue here, as the driver
currently matches against dlg,da9062-watchdog only, so the watchdog
must be non-functional on DA9063?

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

