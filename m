Return-Path: <linux-watchdog+bounces-4177-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CAB433B7
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 09:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379DC188E537
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 07:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC51929ACFD;
	Thu,  4 Sep 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiAO/8dj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABDD531;
	Thu,  4 Sep 2025 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970538; cv=none; b=qERaGFvS+0Ts1UjPzI2S2zs/3diJ478bjFIYh1I1uuSmS+Lqzy4UMcMj+9pBr3TZb8eLfUkUq/1blYou4iAFTDuHHXZgWZzK8zrIU4l1n2wf3y10xtNGRqlOmGg810k9E8OG4xs4+fsBDsQijNjJQC/vFXvGQAsZ5Q0DuhHLwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970538; c=relaxed/simple;
	bh=RyWCIrsgET8kslvpMGuw9gArjjQ1Zyz1qGo8PdRMxBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBKXYMU6UtKfdwKKQxWB//hxgkooOZ3AZnPjY3KRtIxPVixA7U10u12m/nUPaQoIO8RM16UfJ0nRlyy8iL5lz3pKXnbFCn5hHVP9arxjlEPSfvjI14qbV8/mDEH62V5tbSVdow+HPnszQs/EOGIlmniRs2xA9TLx5BeOjX8F+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiAO/8dj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3d2564399a5so363681f8f.1;
        Thu, 04 Sep 2025 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756970535; x=1757575335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xkYk10jYxxNS+x7WRe35lpSvnGGZC6S/4eKOH88rmU=;
        b=NiAO/8djCXDvW67W4n38nmrvjuR/G8kthy/c7PRIZKDGjUriXaxziRFmbZjquKVBwZ
         T7u7T2LP5XGeZK8gaUCYLpxslpyoEZ54wJiIF+CI8wvXhqCZm1I0ekBXVgmxcZNulKVR
         ufqAVu49KqGigWwt1+ELvHPNsc8A/hgvKLa6NEl9guz7OuRp88bAatvy6rDanjE5lf+s
         Ztgib08NSDKwbAkopgVkGgzsYXvkA7iiUa1MB2JRxxKryj8hFJrRwJ+ya2qcd88I6OUb
         YGB6GqIICB7SwmcSeFsaRFmx2gyY9GXPZVJ6vb1rU4Im+TB4UtvMYdJlMlkFn7xjQ6fQ
         N+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970535; x=1757575335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xkYk10jYxxNS+x7WRe35lpSvnGGZC6S/4eKOH88rmU=;
        b=nrIAGHYO0fEaT+338fz86sBFobyKKoQ1qL38X016/++D9dcOB16KuQP47Gm8X9jpdA
         lxLW5JWU5SP0qpzkY1NABEsg9LvbaPckEojMuQA8doStwME2Xik/LU3qd7tYUcXMoWJZ
         iazRhoUx1rkgPtkfEV2GztZdQnDAqCjjZMYx1lwG53+DFsyPzgjW10KM8bnm1HhKsxHS
         5gwOTrLicFD1GdkU2bG7V38DJ+wwwRbmQ32zNr2/GkEQfXC9pPuM6NEr5KiwOJ3WVWXN
         0u0GZY5u6sWYXjG5A1u1sZNEmHzX0O9aoFLnYiCkCRqoirW+uHTeTZ2EOBvFsCI4f9Eb
         d1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUazC8VxPJxpDtCGNd9bBGLm1IqZ7rgVSsBbRK4aIVzsgtC3ZgXY6qFLAmyNWjeUydQPRGqHRTQ1IzFaDwp79Y=@vger.kernel.org, AJvYcCVVuAd6SbsX3NyQtzcGogNfbi0SuBnaeZOKN8oMt5mBOPo84qKfo6CLo2JaBvhGh3kFvyOhWuV6QgeE@vger.kernel.org, AJvYcCXI4wuOgCUD4Mov1sTmBqDBsoUZcqaVcQAATyfOji9X00JYUttwdflNTy3OYo00RoqnM/NGSGIWwe6bqi2C@vger.kernel.org, AJvYcCXdqZF3Z7ZnOzENiMA4k8HALvDpX7+Tt8GIUcFr/FDdQpquBP/WGhtIC750HEcWCJpYIFZr6D7UhlLJQbhKEX2jJ9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQc2UAqIpOZ7wdI+dNX5VeHbTOQ/S/gXPLDBYjy0ag5gHxsfA
	gJ8wweE1H9JGUDBGPG9eotS94iXkBARS+cGRLQ8wqwY0CvptZ9Hwk1d06F3pxNJFgPMFZWvvq+s
	t6hTq11kTfBLMtqsMsKdOzcgHrmpK7UQ=
X-Gm-Gg: ASbGnctBn6p4ymGGeZs9uAfSq+1H3zkWk8XAD+m94BYW+o3FOAY9QOGOtP1YICGxp+5
	86d7NBcstQEnUT/y8vR+hlcPWADo/9a36Z8vfXp3Sbrii7YcENLqzq6VwKy0YHf9sbn2PuiLLzZ
	KThHDxYqO0mYMIIiY2pEBP4dDSadaVLg9myS9PMy019noLbKqAK+xqD4ymlbVBD8xjxU0kEs7Wa
	SzMdnw=
X-Google-Smtp-Source: AGHT+IH4ScoC3WTLnEoHbynJDRFmSpztapTFDWI9D5R9ZcuYD+nzV3+iFBGFGYBQeD9KR3MKQ7hSuiXtmpt9Xct62Pc=
X-Received: by 2002:a05:6000:2504:b0:3df:4fd3:6e95 with SMTP id
 ffacd0b85a97d-3df4fd3743dmr3510437f8f.34.1756970535418; Thu, 04 Sep 2025
 00:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 08:21:49 +0100
X-Gm-Features: Ac12FXzk_nCuYd0etn5cQ2l2wyLXHuC4HYD3WUBKlR1R8iDwZrQcgWjyM69DAdM
Message-ID: <CA+V-a8sJXyw298cZFyezqnyHsAroz5A0T5d6mv+4PAtHk=DJtA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add watchdog driver support for RZ/T2H and RZ/N2H SoCs
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wim,

On Wed, Aug 20, 2025 at 9:23=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series adds watchdog driver support for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The necessary device tree
> bindings and driver modifications are included.
>
> v3->v4:
> - Updated commit message for patch 1/6 to include an example node.
> - Added reviewed-by from Geert for patch 1/6.
>
> v2->v3:
> - Fixed commit header for the patches rzv2h_wdt->rzv2h
> - Added reviewed-by from Wolfram
> - Merged "watchdog: rzv2h_wdt: Make reset controller optional"
>   patch with "watchdog: rzv2h: Make "oscclk" and reset controller optiona=
l"
> - Dropped patch "watchdog: rzv2h: Set min_timeout based on
>   max_hw_heartbeat_ms" instead updated the period for RZ/T2H.
> - Updated rzv2h_of_data structure to include tops and timeout_cycles
>   for RZ/T2H.
>
> v1->v2:
> - Dropped items from clock-names and instead added maxItems: 1.
> - Added reviewed-by from Rob.
>
> v1: https://lore.kernel.org/all/20250707200111.329663-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> v2: https://lore.kernel.org/all/20250729155915.67758-1-prabhakar.mahadev-=
lad.rj@bp.renesas.com/
> v3: https://lore.kernel.org/all/20250804195723.3963524-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (6):
>   dt-bindings: watchdog: renesas,wdt: Add support for RZ/T2H and RZ/N2H
>   watchdog: rzv2h: Obtain clock-divider and timeout values from OF match
>     data
>   watchdog: rzv2h: Make "oscclk" and reset controller optional
>   watchdog: rzv2h: Add support for configurable count clock source
>   watchdog: rzv2h: Add support for RZ/T2H
>   watchdog: rzv2h: Improve error strings and add newlines
>
Gentle ping.

Cheers,
Prabhakar

