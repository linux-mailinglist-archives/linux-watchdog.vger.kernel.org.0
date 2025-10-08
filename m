Return-Path: <linux-watchdog+bounces-4358-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EABC529C
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 15:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB893A3472
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C6C2820C6;
	Wed,  8 Oct 2025 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhRlbOv4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102E1A9FB0
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929480; cv=none; b=nc+s4TOJJreGafdTpMyGGY/N2osgXwnxriMZCaTursE3GLctOfEZ6qj6COGozkn9vhVVFyYw2fit/5y/I3ztNmVTq6/jyQJfHE9zcclYutUs8mOuLbo0bXGSco9dvRa7mZv6hnA+u8OBQZ1UvPTQTGlQoYCghV3K0dnriSRQEA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929480; c=relaxed/simple;
	bh=A26BURxC6YMiPrKrlhFxrgm/8o8uWmciG6tr4QwYCvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opb2LmUKgcLt8is4lR38PeF2IdElhsT9xHGcW/HKTTQfDgRKcV5gmLGoBVvy1PmWvjafkvFFim4H+Mo5WF0MDIeY5E3ZNesBmd+5pSNjb+PojVOHppyU0oQs7yIXbFAE/gFIAyMdOmqFc6DSlpoUBNsoHsX1tjXhGJGAdG1rlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhRlbOv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16396C4AF09
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759929480;
	bh=A26BURxC6YMiPrKrlhFxrgm/8o8uWmciG6tr4QwYCvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PhRlbOv4zv8THUz0h/X0jNr95McCK7w5BriDkeiGlnse51btpv5rqJzhh07Bh7ZAh
	 HYPB6vjxkV46XCji9UKbYjBSoGlHjsOxnKR+HnRbCM+DfVRJtQHbgF9/p6LiRoDCDZ
	 CUHmFfKMfkIoGHJTq5NAx6SPaO8YIToA7MD+ACsXtraxDEpdhY2gva56hU4JZvHkK/
	 p43JG+pKpqYyLHOSD+dvfwm14ncceBkAHY4REH++AUCzye/xwoHB10BdziMQnCOZKr
	 /dyB/jEpF2W0URfuc/9CnOsAdhAif+Vank3MbToQJtYSLZDNtZjpr6Zwxf5Xle+rBC
	 PDDJQkYkpEa2A==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-639102bba31so12485067a12.2
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 06:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8zEnUvPKjhCMp8FrAkTyWd0B8bcfAJlObZOMvvGJmOxjY1LcjMIjbKW/eRFG27v02XQu9aUoXfRqtsyYHww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0piRT1FBEmWxfkiy7u22oFsrTe/yRD78e2uWnuNJZH3KHuqm
	44TPHJPoCUhD+qQ/NPBm6u5s4PpoyqoeEphd5RFmUR108fY9rVxx1gQr2GzVH4OF44TH2AqnTOb
	PjftZ7ImwrWR39g0sJMPrCsho62l7DQ==
X-Google-Smtp-Source: AGHT+IFv45xp6CmYYMNAgyp1xynwbCS0WoWmR/So2r8vGFL0UOBIJChN1MqHBQIH9sdKjfktlTxeaAVHinRIgyH2l6M=
X-Received: by 2002:a17:907:7f13:b0:b45:e09c:7e66 with SMTP id
 a640c23a62f3a-b50aa8a5bfdmr360023266b.28.1759929478582; Wed, 08 Oct 2025
 06:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Oct 2025 08:17:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLLGpw94mbHirGaUx_b-=n1=s25Nhw62xKOQdS+V4s4Aw@mail.gmail.com>
X-Gm-Features: AS18NWCkNq5WoTDTgs_atVT896fAu6mmVrCNMLOjVrqG7W91HT2pNtiDlf44MDs
Message-ID: <CAL_JsqLLGpw94mbHirGaUx_b-=n1=s25Nhw62xKOQdS+V4s4Aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dt-bindings: watchdog: factor out RZ watchdogs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:20=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Minor changes since v2 are documented in each individual patch. Main
> change is that patch 5 is added to keep dependency handling low.

My tag from v1 is missing on patches 1-4.

Rob

