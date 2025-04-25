Return-Path: <linux-watchdog+bounces-3389-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06750A9C96A
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 14:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1FCD7B6EB4
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 12:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70C62512D2;
	Fri, 25 Apr 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBzcLFG2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A0253946;
	Fri, 25 Apr 2025 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585485; cv=none; b=IYj7rBg+sI0wCGfCbMcRTMGuO9n1/Xd/7dnfEfRZJUX9Sm64HU8LXH6qO7aahvAH16lrhQ0dbWnEZuST4ncQNnHOTaDbbpZx97OqM05vwGeP+9sFoh9UXF+vHcQg8tJbzgABQXtYs6ziJ/BzEPMSmFCAJ6x/0cwJzU5RvWBb1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585485; c=relaxed/simple;
	bh=sFXXf+y+6Ey0Xg9tWmjOGnjmj6z3lHSKH3Yiq/V7Cu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViGCPk7+vag1XThhjsZWdyFiGi1cTRPWwPKHdsdi4wQno6vkPOOLMJq6lvhXpSZZ23+216cHwMJAZCvbUT/Aa7v0VudjdECyFGwUtW5xRVxDiXT3zQeHYUOG3LaGReGrYlnriAW4piqpyExJdFcumxnjZZhtM9mm+g6c2wdr2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBzcLFG2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac289147833so388283766b.2;
        Fri, 25 Apr 2025 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585481; x=1746190281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=MBzcLFG2bvYBwzEyphQ2USaZSiuKM47o/b2lAUM0d3/p/H0YVInMVkDm8xB7IiOTA/
         OeYDpgMZzqK0dEvecN3mmFIArWEKwy1aN/hzEIoHnMxNLr9U2L61ZvCoUHi5A/FbkP75
         DZoVCAt1fJR9EoHUyvfY+wA/9fdYUdiTVUyZKpW5aZ5BEyJabTxwv1QVa4aJRUHk1vqJ
         JxZG77TicqKr/AeYLLFM7mY3x9FtytPKY11guvHb9ZCTLrlre++W9jv9IHmFX1szgEQN
         QXV9nAyIGq5CELaVa6kb14HQQLot7f7gsTkixCXKYObHutPNg2J7mCVCv9qemMn/MPXx
         KAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585481; x=1746190281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=VqpiBCWc6HvGr9fSXd3/XL1ow9deUO2kHCb1PwHl1edSKgT6gsGhltRa/ZbmGakLqd
         xnMVMYwQcEiy5SS7tZjOHGmvu9rrYOcdkiipOaUDkPm62/K4trSQTrsk13AD8bf3pfPB
         b8SvNAG3S76ciH6RgjClYF0n/GzpiBiekV7Gnzcfmqq3IOFWsQz6mmqrOUhkPQM1eZss
         GG01JQSk5stau9vc+rqB6tyneh9/XLXKl2adBPhECi4vdw9QB8z+veZGhjL0sLRX1zC0
         ubJwfB3nsJp8uoDooqRAs6atUXvj9hAIhDUCCcLTWwAmg3u1d6nOlQ6DXYL250owM9ZF
         keTg==
X-Forwarded-Encrypted: i=1; AJvYcCVgPE5Xr3C5h+tR92+q+GuFDcJL9VihPRIQM3t18MLGgz3wc41Tz70r5UyQYLDrkuesoXRX+Cd0TLRokxtv@vger.kernel.org, AJvYcCW1Jq/2YbKAjEDAIJfKWdqHHbbeYoQ9y9YR2Aucg8PdjBOapm61fgzCuSXO7mjEVrvq0cHw/jSvIhvB@vger.kernel.org, AJvYcCXZgykM1+Xhlx2KBQFGXGkERcCi+oi2DfNqoKDsSK4dgr1rTwFIVCdLWkpllVfW3x3knEEgJ9lL2BwMpSI7nIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpgbrHncw3JA208c7mfOova72V9YNimaS5UJch22QUGbzrvjw
	ncTn/ztDIEHXiioq/6nhGo4ycqTCQtGp4+XySSDJq0jTsIweAVoL
X-Gm-Gg: ASbGncv2GsOY5qievMQH31GYo7gwsGjx+Qk/ILs6YosYJcGAXvud21IksnC5PA8A0Mm
	dsx9ETQapUwOjCPaxNPrmpZAnTsKNxavtdhuEixnmbgS0dJciyZ6ux79KOLsCZptqFGOM+BvYzV
	ysqEkQeOTbkHX8O0OFXj/X8+Mc5N/BDTe9J4i+U+cjOfk5JY+GFwmk0BKXhUy96oaNxeopuQEQO
	irsXbvw1LS+uYf510jZSG/Iv3oybyPtiwNATfgi2UcM2HPzWOLFjSp62EzWAuhdZFEGaiDAG6Qo
	as0oX0F9GDHFlQr15zyOvdBxiXTG7ZYLj5dCyfNwsHh7yQowCbd+6YE=
X-Google-Smtp-Source: AGHT+IEHCHR6MYIQ/h6kJu40DmCfLvHuVDDSvC4wnftT5KG59v5Z95H2gQ4clO0PJ34esem4CaUoFA==
X-Received: by 2002:a17:906:eecb:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace7103b316mr200167466b.1.1745585481087;
        Fri, 25 Apr 2025 05:51:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6edb1e60sm130717166b.183.2025.04.25.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:37 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm: add system controller watchdog
 support
Message-ID: <aAuFHSqrBrQWU6ek@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>

On 07/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

