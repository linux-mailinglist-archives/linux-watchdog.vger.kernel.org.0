Return-Path: <linux-watchdog+bounces-4529-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDCEC40D81
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 17:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960C83A5695
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 16:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C995E2459DD;
	Fri,  7 Nov 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBAuiat4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8A721CC58
	for <linux-watchdog@vger.kernel.org>; Fri,  7 Nov 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532215; cv=none; b=gMe5+9910nCoBjvTXfbT9m43nn+y/VH6b8yOu0zystQWEkFEqkYCK08CEs+EMKjnQ3/WmQ95DdRbJiJrWrurIixFAqRvDQjtFKVph3eRQZCDgnDq7l6pZNBRpUSUL4L4ghaM5iwAm9Rv0A/YUdxK8i7Irt/EB4p5lWs8lFfQnIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532215; c=relaxed/simple;
	bh=m6h5md15vl7XA18igPsSaXDaZbae5jLpA/oiBVEflwY=;
	h=Message-ID:Date:From:To:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYagJqfPw+q8keTCUMwCzi8Avkiv+9UFDBDzGMvSgCvPsFbAsZtjxIYq8X4/PGc3yUrJkY0bYk3qYxPtGDkylu5U8cGIiPAuoACgRBGwh+6yr3mNX6u1lLtWQ9LW7Z+CdoJprsHZG+aZ3rAqR8mPg4pGj77rXfQp46yZZvnVBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBAuiat4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429bf011e6cso930548f8f.1
        for <linux-watchdog@vger.kernel.org>; Fri, 07 Nov 2025 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762532212; x=1763137012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq+cWEKtg2ZUTyxd/Vz8Kc9fcT1gEAUEGw1yp5hm07k=;
        b=lBAuiat4NMzoJBjXdGf6qV7UglfWMm+nvXHO3L2Qt2rnXJ+qJG5BJEwl5MFGAaccCn
         trEVCZTD8Vp4BKGuOOereI4JMkCdUQJXcC83WhEN+K6VnsZTeQA7RVicoGjWNk3LrU6Y
         J5CNW3PTG/9RPOQnn9w8KZXDrCza8rlPA+GWrUdmJxrYI69XQuXhJPiaMEy5t2WrGZl7
         JqZda9N09B23SRzFW9SEU7/0C65qQe4NGDf67EMXiac5wcZhzXMel+cXsw7Gy/xDSQ5I
         7UzaHhqZgntXBo80wTCKt7UxHTRFPR18gAvDzPcVS8oKs1uBzTicON7OPR+s8FE4zWzb
         U+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532212; x=1763137012;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rq+cWEKtg2ZUTyxd/Vz8Kc9fcT1gEAUEGw1yp5hm07k=;
        b=wriypmDED0aNH2d4kKoSo0f9m0Pfl57HTlVYr70Uyj4FiujWjqB7EqFqvxGeGGCYcA
         C8b9iktxKCmYVie7LQPSnokiMBJhILc6KKexUsZQSZinISbWLv85zoqLcJy4j6lY55b1
         Lbs6yIUfM/p3IQERvK1vxxhwWMKurWfs0z8WlpyrUT7uazNsraGLIHJ883hPlRPn926O
         OOvu8JJ+1ilkITWVW9OGaSt3W2ps24+fYrX8VudIAQ+2UQnQRyUkxmxPhi7vVbkHX5z+
         ybRTqzgHdIXgw6XUAJPSvf1QezGb9QX0ffBSgi02q9GuMi994O2oIV1y62XJvln3dkGR
         lCIg==
X-Forwarded-Encrypted: i=1; AJvYcCV2KTR5Q5mj5YbZRD5XfQfzgudLMcIeZE8dDTC2pDbpirh5se5m6wMMeVTjfHjn7Iq0avgafJfsf7bUkO2vOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFe2vvLXd/wkiAzXcQCOU1HbM/ahNiANmuqbA8zTtUXfWKH3o6
	mdFqtKSb8yAYSDzTr2/SJZbLIy2adNl/1XOGKU/5DlCEj6P/AM3FBCjU
X-Gm-Gg: ASbGncs6T0hbkoaAKzsdGbW6NXIZUQRUqM63myMHDJGk45i+OCuD0oSmYFGrcHtuWgN
	0lNKtxiLugIv6GcRNBoUkHH9cohOfZoO0orBAuG4ZCbeyIJsDd6uMli5dOBRWSfvvErUXjExjgP
	xfskSP+K2lh2I7wVEsBxtUT9WqnY8kPUtFIDtKN4h8PzesGndLS3kX/5BEReh3JaJxxC79QTmja
	g/4cVxQ8O1ImTJALSyT/Z8ca785lhsb9YmdmyaBFU9SpBtLWUcbiML7a++CapkoFAJwou8NPx75
	DjU1KbWhPi0GvusxeiPu48fGYdge+E0FX853hVlXpn0WHiZ78dtP9jA43+KAqRNAcDJgAmiiivW
	oL34F2+l2ZOu2pz+60k2fVCqYgZajCXaeOYSTokSQXorvVR4E0+3nPAa6y7yo2G21R3BuMpJ/+I
	F2i3i2lRNASB0n7435FHSZki0oYEt7
X-Google-Smtp-Source: AGHT+IGBls4w5DXj4dsI+iVzj/lD1T2JS8LC5CnrQ6tP++E+okDJx9McJEWsKb0hTWxZy1/eytT3yA==
X-Received: by 2002:a05:6000:26c9:b0:429:cf03:8b1a with SMTP id ffacd0b85a97d-42ae5ae9995mr3350125f8f.45.1762532212275;
        Fri, 07 Nov 2025 08:16:52 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm6344445f8f.20.2025.11.07.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:16:51 -0800 (PST)
Message-ID: <690e1b73.df0a0220.312af7.18e3@mx.google.com>
X-Google-Original-Message-ID: <aQ4bcJDWhgQINJry@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 17:16:48 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 0/4] arm64: Add AN7583 DTSI
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>

On Mon, Sep 29, 2025 at 01:49:11PM +0200, Christian Marangi wrote:
> Simple series to add initial AN7583 DTSI. More node will be
> included as they will be supported.
> 
> Changes v4:
> - Add review tag
> - Fix alphabetical order in Makefile
> - Move PSCI node after CPU node
> Changes v3:
> - Fix typo EN7583 -> AN7583
> - Add specific compatible for watchdog and crypto engine
> Changes v2:
> - Fix DTB BOT warning (fix crypto compatible and OPP node name)
> 
> Christian Marangi (4):
>   dt-bindings: crypto: Add support for Airoha AN7583 SoC
>   dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
>   dt-bindings: arm64: dts: airoha: Add AN7583 compatible
>   arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
> 
>  .../devicetree/bindings/arm/airoha.yaml       |   4 +
>  .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
>  .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
>  arch/arm64/boot/dts/airoha/Makefile           |   1 +
>  arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
>  arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
>  6 files changed, 319 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
>  create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi
> 

Any chance this can be picked? All the patch got a review tag I assume.

-- 
	Ansuel

