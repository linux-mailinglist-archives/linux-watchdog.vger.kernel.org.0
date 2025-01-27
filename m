Return-Path: <linux-watchdog+bounces-2794-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33196A1D385
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 10:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9473A291D
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F032F1FCFEF;
	Mon, 27 Jan 2025 09:34:24 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D341FC7DC;
	Mon, 27 Jan 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970464; cv=none; b=LYRJMFU2FwvnrjbufaaJdn/BA9kKuSqPfxlJnn7C3PbFz1GgKIzmaxxTOSlPv4XiVnBXgHV8+jIy7Ra+ziPh5BPKq819LxXzZskeRFoNfOhayxKIzvb2Jm7PV0eVwPvkVvg7GCJIh7wtXUtPugMCuLAdDf7UDbrcRoSTAlh67Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970464; c=relaxed/simple;
	bh=JnADqyNp0KbHOONEwR1EWfi6pilaEGmn9LtJO+vRpsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=um2KCFJ4Fv4ImR1QkETNVs7ArafQqE4TUnYpKVN0Y4gu6uq65hO4aJFlfCDX9xH5zZ7TMtwNFmJ5mxgndNZ4dZMf7yNuO2WSzY6GLYS8fZq2jpEVYLlzaDR3FkuJGYtiogP2LsT4WHetFSnUZ5fbci5VyL+fmI86jrB3EVd9MnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b24d969db1so864167137.0;
        Mon, 27 Jan 2025 01:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970460; x=1738575260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDkgDyCWR2El2GidXdSSbkV5ZWxcKYtZR2GgwL75ACY=;
        b=GqNuoXjT0KJnOMYHZZyDE0YM/zVcjpPxJP+fCnehUx37k6LZUTIRdTi+csYg+lK+/7
         BbPiU6C6+CHydRD16+TWPwzQcBIpCUTFBQZ9de6hJDNs1vZaQ4bQX5PRWUHweh7odqi8
         sN1MZHz/gFJJHz0pewUk4NR7rUya4jcXD7ouchxvBAF4l/EclrdoinDLUV4BoB9JDCu5
         JYPycuDqAlVx3Md9r4l/2lytN3MBnjM4miqIADH+tBo27foI+qkpvy81T0X7yJfqJCWq
         2O3gvoDYPzeqdWe/K1Ck3xAE22UDBrNSAF3X0rz1r2EiPZeGKw84anj0pAbXNfSTjs52
         Z8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCULq4ccHsiVe+VRwnNXdAvOn/vwKYc2I96FK8aDSJVcely06qDjk0Sd49EDlSD1SK5SoEsL2ARR0y8iDRodfvN51w==@vger.kernel.org, AJvYcCXvG3TY7c99vNp916phW/+rj6xJ9R85EHiUxwIHW5AVzMLIZw0JixYjxhe3ubv7xXozxPosNcsjlP3kP9inIpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN73VQvbNE/LJH86rjj6eEJ2kzCnFMiCx/fZ9jkFib4nuwftD6
	feL9bEf+KSx+xLsk93SjYrUutVAjs4DwVdEEwwmIwWp533DXMB9fI4nbA/Ry
X-Gm-Gg: ASbGnctT5h6PnToBcRS0Ab9ZYzoWb/ySrW/L5nMhKjufYSo5XkOA54lqvekIAfgnoOD
	XbHJKgesX0nz1vd2raMDR7aRxtO4j9c4FTlRzCNWd9pAnn8DavpxrSOTShERl4z/eBL7oBj9ogg
	QHxXPMG1WGOv3Cx+RU/i/EHRsHmpURJTkTnyyR6HsqRBkm0lbDT4JFFaH5PINjPaZaYM8yzFXCG
	QZkVuU6XJrj5vr71Q8tQmLjGzaJpyvIr2oSOCAiNgMZdfKcXsFLPtfw5Skn5MIIavKVfaPp1vgy
	KliSqd80AFiib0ssSavc2u1sUmYYpfvcHz3+ozv+mf65d+E=
X-Google-Smtp-Source: AGHT+IEg4nuV86hXM4MJ4aNcDU63mekYPINAl1FCNMIEe+Xdfz7HE8d7zQ/xIL3RNxA4ty3DknY6uA==
X-Received: by 2002:a05:6102:f08:b0:4b2:c391:7d16 with SMTP id ada2fe7eead31-4b690ba7dcamr33113255137.7.1737970460076;
        Mon, 27 Jan 2025 01:34:20 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9adb4b0sm1830878241.3.2025.01.27.01.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:34:19 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-518c46cc6e4so1404838e0c.3;
        Mon, 27 Jan 2025 01:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGAOi8IN35Y1xXahoO8Vi9nu+4/f3A2yCFm3E861LUwJE3UdCgzRiuMoEPFtWYAwuwgzjShOg2ZjJo3ExZUfx5dQ==@vger.kernel.org, AJvYcCXGsx7XMEO+vUizRRAznNVPYl0S4oebMnbskq8GFK52FlDyVr2n0LJx2XffI2zEubgyb/vhKYih+kx6EqN7zKI=@vger.kernel.org
X-Received: by 2002:a05:6102:f08:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4b690ba7dcamr33113242137.7.1737970459368; Mon, 27 Jan 2025
 01:34:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com> <20250126132633.31956-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126132633.31956-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 10:34:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2EAFV-UbKtoCY7TKoEnE8ZamjH2g+wM3x_zVjC=nSJw@mail.gmail.com>
X-Gm-Features: AWEUYZklU96oKKjpuj9IRUXpB4ogoUHhwVdonWCnWXPYHXKTkZbZeFkKTeToTFA
Message-ID: <CAMuHMdW2EAFV-UbKtoCY7TKoEnE8ZamjH2g+wM3x_zVjC=nSJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-watchdog@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jan 2025 at 14:27, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H. Both these
> SoCs belong to the ARCH_RENESAS family. So, it makes sense to use
> ARCH_RENESAS rather than ARCH_R9A09G057 to enable the RZV2HWDT driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit header and description.
>  * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belongs
>    to ARCH_RENESAS family.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

