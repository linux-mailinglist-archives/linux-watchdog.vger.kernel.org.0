Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C912700894
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 May 2023 15:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240997AbjELNE2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 May 2023 09:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240817AbjELNE1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 May 2023 09:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2023783CD
        for <linux-watchdog@vger.kernel.org>; Fri, 12 May 2023 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683896625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
        b=KIUMt6k+mEpfTCRhEWgzyyNLBcPrSNCd0NWAvnosd5HNPECnQ4muQ+BLw0NaUStk4PxSbH
        foq773bEVYQOvUxMW1ZHXdpEJsRvbtiqE/TrjtfxuqlEr5zz+pS2x1SybUL4uCu5dFCQDe
        qPF/+x+aU3UVaCTklldeEpyyvmzzkzM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-aTVkG9L5Ouq1ShxjWF18wg-1; Fri, 12 May 2023 09:03:43 -0400
X-MC-Unique: aTVkG9L5Ouq1ShxjWF18wg-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-b8f6bef3d4aso19456688276.0
        for <linux-watchdog@vger.kernel.org>; Fri, 12 May 2023 06:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683896623; x=1686488623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
        b=W/dEQKTjIqc+HBhIJVpD29Kv6NrJj0enjc2q0GyT1XvUwKN61bikpIhEtaYayLXGDY
         lE1UCTOFT/rmtpkiIDkOBL0kkt2dhs6jFR0pdHh00EsfSLmhI8ZSnDHtCt8K5LwVCyn4
         nMG0hCZVkUXG2crUVasfFIZMyYpT1e0IyKFbXYJmdFb9BZkwfH7S6Qh/NZHjyl5wqLxP
         nkXNNAEB+zxopFvLs9ameJ/gji0j/TopAdXQ5oBxUD+6OIJo5i+d/FhGkPWjOmdvSM2S
         jqWxi2V4X7G79uSnJNUnnmC3vOI9kuaLk4xITRZ+Zbr1+nf7Dl4aQsskqJuShf2y8z9i
         jMvg==
X-Gm-Message-State: AC+VfDwt+xOwFIJxEPOHniR/1o1vDeDDjz7k5fTfPwNFF8fsKGPgIBeg
        S2FlXZMgQ8PAhF4L09A4JyB3HEyqulLZKhsuSVKVVIHN7ZSrme/csxPAbM5qwTPcZkEF9vjG/Z/
        8lS5B3mmEP6vnd/cHMdzObu4iAM8kOS88j6AZ4lJaaKE=
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id rh42-20020a057500e56a00b001057a078604mr943433gab.61.1683896622964;
        Fri, 12 May 2023 06:03:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dVexvddLUcjN/zVlZgJrAoivqibOPzux2/Wn/gjHcLQ5Nb6s+25KWtNakTprxdBljBky3vIfmIcNIUXqFI88=
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id
 rh42-20020a057500e56a00b001057a078604mr943377gab.61.1683896622432; Fri, 12
 May 2023 06:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com> <20230512100620.36807-5-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-5-bagasdotme@gmail.com>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Fri, 12 May 2023 09:03:31 -0400
Message-ID: <CAC1cPGxxOhmQS6J9tDCSaaaMEAgpCVRv2XpndyNnyEfvUKcQoA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] net: ethernet: 8390: Replace GPL boilerplate
 with SPDX identifier
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Networking <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Staging Drivers <linux-staging@lists.linux.dev>,
        Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
        Linux Kernel Actions <linux-actions@lists.infradead.org>,
        Diederik de Haas <didi.debian@cknow.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Airlie <airlied@redhat.com>,
        Karsten Keil <isdn@linux-pingi.de>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Sam Creasey <sammy@sammy.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Jan Kara <jack@suse.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David A . Hinds" <dahinds@users.sourceforge.net>,
        Donald Becker <becker@scyld.com>,
        Peter De Schrijver <p2@mind.be>,
        Topi Kanerva <topi@susanna.oulu.fi>,
        Alain Malek <Alain.Malek@cryogen.com>,
        Bruce Abbott <bhabbott@inhb.co.nz>,
        Alan Cox <alan@linux.intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Replace GPL boilerplate notice on remaining files with appropriate SPDX
> tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.

> diff --git a/drivers/net/ethernet/8390/ne2k-pci.c b/drivers/net/ethernet/=
8390/ne2k-pci.c
> index 6a0a2039600a0a..ea3488e81c5f3c 100644
> --- a/drivers/net/ethernet/8390/ne2k-pci.c
> +++ b/drivers/net/ethernet/8390/ne2k-pci.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* A Linux device driver for PCI NE2000 clones.
>   *
>   * Authors and other copyright holders:
> @@ -6,13 +7,6 @@
>   * Copyright 1993 assigned to the United States Government as represente=
d
>   * by the Director, National Security Agency.
>   *
> - * This software may be used and distributed according to the terms of
> - * the GNU General Public License (GPL), incorporated herein by referenc=
e.
> - * Drivers based on or derived from this code fall under the GPL and mus=
t
> - * retain the authorship, copyright and license notice.  This file is no=
t
> - * a complete program and may only be used when the entire operating
> - * system is licensed under the GPL.

I don't think you should delete those last two sentences.

"Drivers based on or derived from this code fall under the GPL and must
retain the authorship, copyright and license notice."

The notice has:

 * Authors and other copyright holders:
 * 1992-2000 by Donald Becker, NE2000 core and various modifications.
 * 1995-1998 by Paul Gortmaker, core modifications and PCI support.
 * Copyright 1993 assigned to the United States Government as represented
 * by the Director, National Security Agency.

Nothing in the GPL requires retention of "authorship", as some other
licenses do (you can argue that GPLv2 conflates authorship with
copyright ownership, but this sentence seems to distinguish
"authorship" from "copyright" as does the listing of authors). There
is (arguably) a tradition of treating extra author attribution
requirements as legitimate, but if you view them as extra requirements
you can't, or shouldn't, just remove them arbitrarily.

Then there's this:

"This file is not a complete program and may only be used when the
entire operating system is licensed under the GPL."

Whether or not that's a correct statement of GPL interpretation
(perhaps it depends on the meaning of "entire operating system"), it's
significant enough as a nonstandard interpretive comment that I think
you should probably not remove it.

Richard

