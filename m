Return-Path: <linux-watchdog+bounces-1631-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B733E964ED1
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 21:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AEEBB21412
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2024 19:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5B1B9B38;
	Thu, 29 Aug 2024 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV4TTSlY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA747A76;
	Thu, 29 Aug 2024 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959769; cv=none; b=rh9rEa5fkcEPgL3feq1t7jDlv+/osNgJqm13rzxrhkWp+vvUXX+sqBIzZrHQz/Jbr3iR7kLxXuhYMSw0dc0wy0d6OCNPvmKBIExEchvNgkvCSJSsknsDKKuDhh+YPSUVk9hmwRihzuMwZiaAMlC0jQzwMnvz4v7NR6VC7NnIlQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959769; c=relaxed/simple;
	bh=3KpG/wc2uvwyuNONFaqBxDlDvvAS4epRIbXbeEuwtwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5UAKduD/ymCyyg6mbN6CAkhjQQBS4YuZZTDWm9ej8s5ClH7xD+pN7+0tcAzcseVVPOngIjYnW5LecZuweaSliE/+Sre0kHNwivnWRQEmqVGdNb8x+ecabxzuCPC7ApNDoXsd/5MPhNvVVRFEEJBHJ9DV0MH2rXadimVyqX8RVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV4TTSlY; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4fcf40c9ed3so387392e0c.2;
        Thu, 29 Aug 2024 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724959765; x=1725564565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGGo2SsQCJsSRPiHAjvLnUoOPi0Z0l/2WghbU6Jy+dI=;
        b=nV4TTSlYu5R7IDdHne7y9pIfl4IER4snxqo+OV3wmbM4prFNYGDe7KK5HPkv57ZTIk
         PZy7VszheVd6sU/Eg7fVWOUcSAofZbJdOV7u/lGn/DRPoGDMF+xpt420X3GHfJoo1Gr5
         VLF1gIrcudUivK4QsytOoTYm2wKfM2+kZ5runZCdRuDs57idx4nLB4QGCI5uFv5bDOsq
         OcVRrQAaxfLKZidUnuonhXxHy+XTDzaFFB1B1rsw+UfiAEIAZ+Vw249ngNqQcw+/lt6H
         H56B3lCsFBR4mEhlOLAQY2+7C0XBEqHjKcwHYCRpLMXgbOaefvEx00hvBo/O1iVD51Ld
         g1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959765; x=1725564565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGGo2SsQCJsSRPiHAjvLnUoOPi0Z0l/2WghbU6Jy+dI=;
        b=Sf3iQ4Uy8Utq/E/vncD3Ksh7kx3lvmmj7GMLTPnWHX9iSaigVhtYxBJLvbbYUHn4LM
         g3KXH8CnzEe+V+K/+0P9UD5cgh0zDJKk8u9//DYC81tOsXUes4OyTkF5cPD/B0PzjKIl
         9hC3Sp+xmQ6kJHZuAilnDBoJHWWd4aGmCd5aUky3ykdsbzk6TS4t+yScPRPv+b652tSt
         ztfazJwO8KiI3G7gfadxJ5dxWW5EdsrXrr7msqHXpLuEtAY1ZUKco32THROCSXxEgM6D
         SLH8cR2K7Wh+n6Sw/U8JUG72GmwiQSbz4j4MWQciVQ6AfiXvEFL5tmznHFIsDU1pgO/g
         LRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGOFXZQCEHtY1grdTD7kg0avl6P31DFUQ4/CSw/XBvI6Lw1bXp2IV7PkpyflzaQomqWJO+SyXBrz4iLFFPxgQ=@vger.kernel.org, AJvYcCUeTR4T4wISmUnfHNDEhbXiOoKu/nxoBSWq9tX0qNiNzYsVFFjDN8LRKktmjBWK8DPG9M4ITvcw1uAZ@vger.kernel.org, AJvYcCUxYj0gWea/IwjnOmzGUlhw8pg36QWeB+cIFGdQdlSd/ifMNU/dsQFLZnHU1p2z49fnQ6GWNOjpLbuG9M/2@vger.kernel.org, AJvYcCWeHGhoGtGSTVXuDw9q1eiv1GFcUoy7lg9Y7kGn43RfbasKbK2GpwBE3c9KoyA2ouvJ7Kgj6RJgGOx5lIri/JkPcVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqURiJLy0pcwgblkB23L+H3jLKj8S/W6iMsij9SerKZtOpu6MM
	JLc3dIoD5MnNwfHtibtJ/mRIU3V0dsPcAv4HNfUD0w2YSqurXwrcQLlbkuMvFPQml+gexnDfiX3
	yFWCaQQqbI31llH3jPRM8mfEevn8=
X-Google-Smtp-Source: AGHT+IHXKA2wunTaaLZKYHYRHBG7bSAniQ2ZxL8dU1VVslmMiYZoE7LHztbtU809u4jFkK9vfv83aNVqlxPAOYB8C48=
X-Received: by 2002:a05:6122:32cb:b0:4eb:5cb9:f219 with SMTP id
 71dfb90a1353d-4ffdc01e02dmr3845066e0c.0.1724959765459; Thu, 29 Aug 2024
 12:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240806210623.183842-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUW8FjgNb9J4hsfZOk3EbXMmihemm2BkO4pLAaZ-QGNiw@mail.gmail.com>
In-Reply-To: <CAMuHMdUW8FjgNb9J4hsfZOk3EbXMmihemm2BkO4pLAaZ-QGNiw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 29 Aug 2024 20:28:55 +0100
Message-ID: <CA+V-a8sLppm1Mn08nVXxXOpmBtwmDmMQjzuAcuV9yku-0V=5Hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: renesas,wdt: Document
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Thu, Aug 29, 2024 at 11:07=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Aug 6, 2024 at 11:06=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the Watchdog Timer (WDT) hardware found in the Renesas
> > RZ/V2H(P) SoC to the `renesas,wdt` device tree bindings. The RZ/V2H(P)
> > SoC features a WDT that is compatible with existing Renesas watchdog
> > drivers.
>
> Your patch "watchdog: Add Watchdog Timer driver for RZ/V2H(P)"
> contradicts the last sentence, so please drop the latter.
>
Ok, I'll update the commit message and send a v5.


Cheers,
Prabhakar

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
>
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

