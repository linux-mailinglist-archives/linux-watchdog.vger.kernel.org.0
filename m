Return-Path: <linux-watchdog+bounces-3406-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B28AA7136
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 14:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8D1984DF3
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 12:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855FB2522A5;
	Fri,  2 May 2025 12:06:53 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01223C500;
	Fri,  2 May 2025 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187613; cv=none; b=PYGIRVTrw35IFovOymXVRjigoteWpvc+f6gi3+TllUETeQ1uim3xPebEhjJBlQiOSBuU5O/uy3bKbw3gV4qv6V94TXdjxCdcS9NKldCUde8ymhmQn/Q76FWe/qx1Vl+kHYE/hKrK6UPF9+Q8FBLOkcCGqMTfNFpxBWkaZa5Jqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187613; c=relaxed/simple;
	bh=UKro3QdZRIq1amBBE4D4xDPLN9+5qRRN6poL9nd3lug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goR/IHquICFUVhUIZRQxoDhBUgLZA9P6kHfP5JJp12HOMONLnntEOMkBdIkj7Ky+aHq5ek7qrg/UAkVN92/fHEpQxAjzByfQTNaZHWHGChbrPSIBhkeH1RsJm4DFOwxDBYnE4ifoXFM7euNicuWBSWdxC2ipDi0N+aRid8KsrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f254b875so22218436d6.1;
        Fri, 02 May 2025 05:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187609; x=1746792409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fbk/yJweNXxGum/JgiGBSCMh0BOffu7F1Fg8ZsYFkDE=;
        b=W3R1dK272tHfO/RlcUWItskKf2V04b4jLCkuyuhVt0aLGhiIKGMnCp8SUpZougvdFy
         lb7tWleLbPlecyu3S0FVdbYHdOhoZmitBCxA2rBmmoHLrd3Tab6f/+NjrWxP78Tx5i60
         SX1ScWqak/edr4ikHLQ3N4KeS/OAaYutT0qpx3OBA2Izt33NgA7CPY+LLDguKgPO88uw
         fr8+fEIgDAXEnMWZxh4CnJHeOCv1LGi66GUIX1O2GZ8kDTQTUbO8LQa8SRoMUuhfZLja
         lpoxI7MWOXoBHvaCtsEsnV3gD/2ieb5HSE0Egxwwf2VRAZK98RlvyZx9Eunh6DaqFG+3
         KqaA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wCeRWUzz475+TA58s2rpxF5XYGEZ5/g7nw4KVtKJoFQvwtZjCJFyKPcD6NHIiCDr2MPDRb0zXBUNhvSobsTW6WI=@vger.kernel.org, AJvYcCVQnOi6vcmWOXs/NvoFWeI4ihP0pfOk1+MWiQRdVb99eJNcY1+fPSCVBjemphb5vY1gbTyyL8icVKi4@vger.kernel.org, AJvYcCX0cK7aA9bsiAdEnkKN+9B6jcMW+fpc4vhuHHvlX8fRqKZcUJKObyMhtU6HX746cQOjA4iZW2YOxErwf+EuptI=@vger.kernel.org, AJvYcCXEkbMhQbtbCANWQW6q2orvmzp/9WZVShDb6M3ufrFL7ejUkeVcFsPoGhvTL6K2XoRwDixSOfl1EVG3u4HO@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQS1LBS7wmEY3ixjn/a6h7cfm9BLNv7F+rSKGFy4q7YTuCu0u
	GVyuUDF3c42Xlk6BT3nwHqz8eYOdqlr1CKzOtvP42xapqCDLnP6QY7FzBecm
X-Gm-Gg: ASbGncul/aAqOWPRYkQB00HY/aTiEfcaJs3Rc1/qqCHW/s/ixhqelVMiAD4P7y3dOe5
	BSMUD2+2grRVE+rhUNNZBUlhEKwAgwoLPbJWRw4xaipBIBGUQFo09cK4YdHphyWVYkL7QOIjgvc
	wiHAiwWzCRQjCWbf72YATy94KOKptaTBIeqLuuRk+i6q1r8NcvZ4JwAn4Fu6RH+ShF/OxUwUY2U
	JjghShd0pe18Ybw3SgkG+2crEKDGRMsrRzMOBgVQ59LksZIxJCcuwFjVUS09K87i9gXwVQqdxz1
	oZnsOeTYc3VT9e7tMAfKBbYobRLIojJBuQSEzZRLcnl1o59Ct6WKiRnPSdv6BKj+ajwFElVzIHK
	jUj1Ax/o=
X-Google-Smtp-Source: AGHT+IEwCDj+mElIe+BFbLGotwbDEx61yD6v3IW2NHS4tO59srQM4KttSWAaR45Ut+nHuavg0sw0pA==
X-Received: by 2002:a05:6214:21ed:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f51524f9acmr39885266d6.6.1746187609374;
        Fri, 02 May 2025 05:06:49 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f5a2sm17441886d6.78.2025.05.02.05.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:06:48 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c597760323so219790785a.3;
        Fri, 02 May 2025 05:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa5M0fFWmyqoja/4GwjEMnOMmtD7UHgXrio4GecyIkw4rgjaZD4ZxNGqYU+l4HhhzV+BzdlBSbvho1YgZz28/pU3g=@vger.kernel.org, AJvYcCWt0zi+QyhcqzcNvoBvAAY9ZOmlNs5uj3WGx0bzqYDSTP3xrp7wi1W24ah6jZJ7iDdglt1vI6+W+ZaG2dQV@vger.kernel.org, AJvYcCX/EJUqEtxjy97E58NdEJLm4i4LDM+yzGqqTyUrIwXibJy6pyvC6TGCgjcBnr6s3F8BqftGfLo37DBWt6uOnZk=@vger.kernel.org, AJvYcCXXaB981cSoXMkE+l96efsc3CmBd1K3/RW3kGkpZO+01ci4XOR9RgQ7w67uXzEFqMxSaJxZNzeYCZc2@vger.kernel.org
X-Received: by 2002:a05:620a:4248:b0:7ca:cd43:e46e with SMTP id
 af79cd13be357-7cad5ba3155mr402540485a.36.1746187608019; Fri, 02 May 2025
 05:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502120054.47323-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 14:06:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj-GeQhY0jdeiWYvyt9mEZYe+erO9peY0OVkRAnMFAtw@mail.gmail.com>
X-Gm-Features: ATxdqUHymkxMas7Qiis2zfkAvJ9fGo2xLqlvHjlSHPf44p_b5tCMiQgFndKdEiM
Message-ID: <CAMuHMdWj-GeQhY0jdeiWYvyt9mEZYe+erO9peY0OVkRAnMFAtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/V2N
 (R9A09G056) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 14:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the watchdog IP found on the Renesas RZ/V2N
> (R9A09G056) SoC. The watchdog IP is identical to that on RZ/V2H(P),
> so `renesas,r9a09g057-wdt` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

