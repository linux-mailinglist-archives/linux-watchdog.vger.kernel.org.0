Return-Path: <linux-watchdog+bounces-3388-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E308A9C968
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 14:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42C3D7B6D57
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 12:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D312522B6;
	Fri, 25 Apr 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHnr7k5B"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665FA24EAAA;
	Fri, 25 Apr 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585475; cv=none; b=s8nNiVtLjn1Ki76NJsqr5xbCoVoI6nMhY7cCG4g2ya/ncqGtuwLkwGa+DUPIvwfcSo1+JrDV0idtu0iVUTEplMR9qDw6+SGrAnpNCCwMk3JCpNWBCdPLmgtFjpmiuEWySvepXHbAmhb1cxUWfh2fkj6DkVj7Or1Ae1KeOJVwFNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585475; c=relaxed/simple;
	bh=wmiEsRCKskC/Mif+OPtRe3wDfkOxVjGaJYhZdFWjEdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvcKH6EZzpbvtOgSoUHXnPPJ6b93XLakuwl1fWEAkPndDjsrVfJtlH9iSW36VQ0jjBqF5Y7AKifQrOCZn3bFdMuhSqjdIrdapvnRJBLNZpEgF9WgHTE4HoGR2lUxbCWvP6+q+W0GAX9A/OcQHM5nOqlZb3EA/TE4wszv8tGlEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHnr7k5B; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so2765814a12.3;
        Fri, 25 Apr 2025 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585472; x=1746190272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=VHnr7k5BnjdU/8hqL2VyUYxtYS4pakdJDZQxePAJ6T+FgBeaNWKzOQhhYiOy6yFMIv
         4Ut5nuMNScrfCyt5PCGMMrGnKC1RGEaLwomCKOpTSJ4JTZ53xkmjca00ROAIVCLRbeMd
         7EHI+WN0ly8MttPD+N6JgbsRbLnxDbPHicoftkxqEhh/Q1HRYuPi1ExpQeXRGjXZ3SnX
         2geATosNBrDVnsyAhbmCr1WBOI5k2/pCyeJeSPbvrEYiPqCQSeuy2Oc8wrtgfhMw77wr
         lWdLa0XC7yEJAXZ6JDXIbhwOJO7fbv5Y08OS9HxfPxvHEcSksAToZDRW0fMBW2DHMe0+
         TvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585472; x=1746190272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=CnAZisuoM7vSS+S1v60zoxHaWOvNW2QoS47qR0DsE6xqyVItbEnpMZP7YmgoSiKB/G
         HIDWFKZVSC3WZVMu8QCt4ALonEhb7Nw5yfBJ0T3dJ+V1h9bMotVJAeDn1y1ih6nfS6Cq
         JTdWeAtDCUPBaE/BE0BpUkUk/wzNAjpGBSbqqITFnj/WkAwbmZ3AZLyly2JKCChCTgc7
         lN42XWZPvaEnhXCugyPI8L4uVhfvqbgXTt8tqKaSGoZZxLpsqHxQSgJx1DnvPSiSG1+3
         deqkpuEksk+fqmg1pYaIDUn8TbF2m8ukijPrOtj8ZFy0KpMO4+aiFS28ZCXYo/eqDWBz
         9Osw==
X-Forwarded-Encrypted: i=1; AJvYcCU8v/GOu91+xA2badAw60wKuyBXmodoadSIPhmKZ9Hr2+TpZcPkKALw+eHIhDLJbZSwaIIWd/AVZAmhEg8SSKw=@vger.kernel.org, AJvYcCXELcwLJ+SPrto15x8pwhCEKgAjyQ6iwlZKadxIzb6dl1Eb/qUg0xBMu/NouZMqFSi0oFU/JdJj5hp/9yqU@vger.kernel.org, AJvYcCXR/Sm4w1VBejSc++qJ3Vy+EFQIRhFbANEfx2Tgmo5BBLOLHlT/veeNf0Q3sYwWt6yOaDxlD1ZnK2A8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9b6K0fWPbZPJ1ZrzsDdUn8Pv19dXpkkZS5zg5shUb9IYxQHma
	W0+ABjv036hH1ik9oMutJffs7Jdc2oIpaNab9Lic7b+3mk9jXlG5j/WKw8pQ
X-Gm-Gg: ASbGncs64vW4bv2+MXtdiI/k6no+8FywHX+pqPX9Db3LJQ+J/nGCHkYNOoIZOu1n1a7
	3T9IupF9aS4hoXXEG0IcSkIbWLf85Q5maEGDW5AfqlDultkhdbEqzCqO2fQ7mbtahhbn5V6xxtr
	X28vQW9qodteXpB6HbUJqYADZgPzwO4HqvNjzqpp8XXJZIOUp0k+h8GhSWOWijQVXDh9IcvPjq2
	OvclNIYt/F1bLW2ZgM3ojr6OScJONfkdRWhpDSdhvZOd0yJFJGmJd1R69Qc2EycoUEyDFqU6G5Z
	s4fbYcKW7WALCCMlpTYAkU0eQPnvrBwibYzF3qdY+BvgGEDnA4rcH56MDaNTtxwM/w==
X-Google-Smtp-Source: AGHT+IH/NrWffoy/u2nsOLxymoZYRZ+CZhi9kKY0D1DpYpA2UcXxmclpaKgPo2+5Qdo1fcEv82aORg==
X-Received: by 2002:a17:907:781:b0:aca:cad6:458e with SMTP id a640c23a62f3a-ace713c2584mr182471466b.43.1745585471276;
        Fri, 25 Apr 2025 05:51:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4f8835sm136631966b.67.2025.04.25.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:10 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <aAuFApCnKVqKA1Zu@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>

On 07/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

