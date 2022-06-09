Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401BF544868
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Jun 2022 12:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiFIKLj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Jun 2022 06:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiFIKLi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Jun 2022 06:11:38 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9E71567EE;
        Thu,  9 Jun 2022 03:11:36 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id c144so14872587qkg.11;
        Thu, 09 Jun 2022 03:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0CEJ/qcwTzcY+cM9PfLjLpJfyNjG7OJcgxv5r4qzbY=;
        b=xv7XX8trPJri7kEQtQHOvKK2qRlSlx5bwIh845eozpyUI08aKddEgLP6YBgCbc16oS
         7mnRKbi3uv2Uke/FDcqtU4O0/RrJZxqUo2oJO6og3OLxKbWRTINs6hLe257wIgJgVur1
         VcgbdmSLTVaJ9DSMJ65XFXVQuU9bGfHvYlPB2f8EEUcMS7QSYyWfloVZK8VYJt0kVxJZ
         KeNwj+w/8bRt3WKcN8CXBvBTDFWB5zjO1YHp26rkveJS8lz5+gqkbSKZ3Bfk6ZQb3vnk
         VPddOgSZfOYaOCoS9RhZPCyuVwkIMSWpRXhbKmyS9KimHuYFoUERPMDFUdKGOE5sIioa
         F3Vw==
X-Gm-Message-State: AOAM531Qwiuv6ri7zi8xIB9fPmRpN/t2d89cCPfMfifFwdX2Jxl4tfDb
        w3vrrsfY0As17DIxgOWwItQFoKBx1eebNg==
X-Google-Smtp-Source: ABdhPJycLmVR8y45h3BBqBsT9URHvWUlnLB8CFgsJHMixm7P3n5mwdDn/FIy/g9gAjwUX82xfMw6YQ==
X-Received: by 2002:a05:620a:4553:b0:6a6:fcb5:c2f9 with SMTP id u19-20020a05620a455300b006a6fcb5c2f9mr6167488qkp.299.1654769495878;
        Thu, 09 Jun 2022 03:11:35 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id a25-20020ac87219000000b00304eaca5e5csm8661886qtp.73.2022.06.09.03.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 03:11:35 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-313a8a8b95aso1812547b3.5;
        Thu, 09 Jun 2022 03:11:35 -0700 (PDT)
X-Received: by 2002:a81:4811:0:b0:30c:8021:4690 with SMTP id
 v17-20020a814811000000b0030c80214690mr42003708ywa.47.1654769495142; Thu, 09
 Jun 2022 03:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220607135619.174110-1-phil.edworthy@renesas.com> <20220607135619.174110-3-phil.edworthy@renesas.com>
In-Reply-To: <20220607135619.174110-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 12:11:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyeB+2Sx072igo1uFmAgYoJWABSX2Ks851=tzNUrKzEw@mail.gmail.com>
Message-ID: <CAMuHMdVyeB+2Sx072igo1uFmAgYoJWABSX2Ks851=tzNUrKzEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: rzg2l_wdt: Add rzv2m compatible string
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Phil,

Thanks for your patch!

On Tue, Jun 7, 2022 at 3:59 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The WDT on RZ/V2M devices is basically the same as RZ/G2L, with the
> exception that the RZ/V2M has a single combined interrupt, whereas the
> RZ/G2L has time out and error interrupts.

... and that the RZ/V2M watchdog does not have the parity error
handling.

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -256,6 +256,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>
>  static const struct of_device_id rzg2l_wdt_ids[] = {
>         { .compatible = "renesas,rzg2l-wdt", },
> +       { .compatible = "renesas,rzv2m-wdt", },

Hence this is not sufficient, as you need to prevent writing to the
parity registers on RZ/V2M.

>         { /* sentinel */ }
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
