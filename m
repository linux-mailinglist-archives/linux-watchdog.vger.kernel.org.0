Return-Path: <linux-watchdog+bounces-3940-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107AB1813E
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5887A84A62
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B31D246765;
	Fri,  1 Aug 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvIa4Em3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FED2367A8;
	Fri,  1 Aug 2025 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754048564; cv=none; b=HvzRC0KTmuBDtdj5ypPwJkYLDrf5ZUNoUQ4oAChCO90mbCOiHsT6uC1a1LRfr9bOSn5a+wTH/hDzgB2jMD9cNunhGiKZccHbblzGiC9NM9RoAQKbpYWF50Amq8JFQy8zmw1jHjYg6qvI0Lzzp/AOn9uV3ZFT/zqVA9wEeyAgKq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754048564; c=relaxed/simple;
	bh=ge1vXMxZRii7E9qNjZ77uD+NkdbM9zxuTcy26IRKlzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXt7U8L9BrD+nmJedwLhbAAM2RROFymiS5Jgkg37Um4qevp44ve57h590A48Qzws6G2CDEC/LzeiltgbpHZfkZU7Y8BbgLOcZIZLuJFn7qRfaCzZoI9e34sW61KBBYIqviAYqF4zvkdQ3zUZoPGqQbEH976A0kN9v0UW77alNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvIa4Em3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b783ea502eso1444135f8f.1;
        Fri, 01 Aug 2025 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754048561; x=1754653361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge1vXMxZRii7E9qNjZ77uD+NkdbM9zxuTcy26IRKlzI=;
        b=dvIa4Em3WRk+FOK7UJwIiG27s8WoH+7hLL0Nzt7KxuXEZIbPoyJ3Zpg3H8RdanlVMh
         kIhDPis3N1j2fKOzV6vG5eD1JGxWJ/zSKJ0eW6CDNSONXXI0hJMdPnblugIC9B5Q7bqI
         VUUxq2d0wl2ySREBWJRYJGUQrw8tjNgDna2R24XEcXCFZTFM0chg4iYCnxxKJQDrYaZV
         6oumlHFtgZqFOO3zGIWIHwLxgiWLHUyR8kN+LE7kro4JQ0slwVjEntxcU/iLGeuywHmY
         H2fJ8nme4ESTcUIgDSzWz0RHvbSLozXmUOaTLNMFQTWqI9O2G4k932zgAQkqTJlvmgY4
         1u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754048561; x=1754653361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge1vXMxZRii7E9qNjZ77uD+NkdbM9zxuTcy26IRKlzI=;
        b=idiBso7LMio4yTyj5yCXB5y+4ZANMGtIGeckqKck3gjwv4B+DH2EmawDtXp0yt9wH8
         aPqJ0kQDONt9O1gIUtPTA7t9qepWsH+Eo9ZGHTyi7BHPzxtw+xqMqXzCWlfVeiQL8JX4
         B6xOHTq+HVmMS8EClcvO/H9BioJLtOz3VgAHvAqEXgN+FPishN1FIuDCuQ+NQGzX8oU8
         vLJlNoUpoNWjHjaNQCmnDB3JY22x5hvc9bJ8m1PqAmMHg8nP2MXkadbB/98PVpX7rsc3
         QfBHfm4TyzDB8TQ834ttK1eSug8XlkACHzOCh9F5VqJYDiyAXSOxHhf+5NRojl2CrPat
         eNyg==
X-Forwarded-Encrypted: i=1; AJvYcCUoDWjUtBFqS2g0tVXA9/iB/CgHXyv5SS1FXJN5hciVLvIOz2VKFKkmBBhSHH885+AflM2bezRh70NRFySqahQ=@vger.kernel.org, AJvYcCVQ8Qi5oZKkO3uY6vENQsAuU1Kt3b27t5a2liKjxC8BhUS1O6yeSUbSZtv2rYEo6KU8kIKCCi7oxibCr34d@vger.kernel.org, AJvYcCX7tKSc+VttJfdm2AswMSeyCGfr9o7lJ4OVBpwVXnUsIUrjCakjm8jyinEPfFP2MBNCJI2Moym7j5rjj6Ca4T43QF0=@vger.kernel.org, AJvYcCXddTj/ulSiIsjzm/PVKuw2C+tQFTuaXgxP5WjKbD14aC5iT7nI1ZJX9TEdwH6Q3o8isLjwMEQxIrE+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Vu/t8SDl3UXxGJ/6S6d+lIy7eKgMkpu3iDixIxBMnszb7dIe
	12dnsof5Yni9o4ZC47ZwCA6IXxPAcXggDqIaWuB50cfMa9HHX8GvDfIGjy7Ywz8l5NEHVzQEiFA
	w6HfWyMHpvtaqF6uoDiCbOj/vNEvw0Gs=
X-Gm-Gg: ASbGncujQgGIkjlEXWlGT6FEQfCu4KQIs99BvRXdKHS7BKh4OiQUlMDMcc07CRuqV94
	Ebw7KQ0CThbt5EL/RKERa/B6xex9xVC97zPdcNqGBlJMaCIw1qb/g038NEjNbdWOW0JkLsvL4Tu
	SwIMrKW82dBkyMSwxcZSgzXKy3xPySsM9OQlVY/iLECqCFqTBZVrgDLbMlnLZVKvHRFSYo2ADtr
	Bwn4urW42VZJmLHzcOA
X-Google-Smtp-Source: AGHT+IFW2Ox2G6V3KbTDmivPliuNNNEuGZ1niSNtFBzJVEBkud4GTR587ujBtHknuXy8/lJ+ciZPYzuW4hPnNGGt9zs=
X-Received: by 2002:adf:9bd9:0:b0:3b7:9703:d99f with SMTP id
 ffacd0b85a97d-3b79d808289mr3827649f8f.27.1754048560625; Fri, 01 Aug 2025
 04:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <aIw86G4sOJH0yT5i@shikoro>
In-Reply-To: <aIw86G4sOJH0yT5i@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 12:42:14 +0100
X-Gm-Features: Ac12FXw5nyJSg3tns9bLB_dxCwt0LxAawlvmjwH4i7MukYEb0200ehLAwwPBH_Y
Message-ID: <CA+V-a8vP5HyQrDTtLukifdMy-9bQw6LOBkE932aQ1TBvGPv-FQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] watchdog: rzv2h_wdt: Make reset controller optional
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Fri, Aug 1, 2025 at 5:04=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 29, 2025 at 04:59:12PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Use devm_reset_control_get_optional_exclusive() instead of
> > devm_reset_control_get_exclusive() to allow the driver to operate
> > on platforms where a reset controller is not present.
> >
> > This change is in preparation for supporting the RZ/T2H SoC, which
> > does not have reset.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I'd suggest to merge this with patch 4.
>
Ok, I will squash it with patch 4/9.

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

Cheers,
Prabhakar

