Return-Path: <linux-watchdog+bounces-4568-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A49C54D9D
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 00:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F9DA342A4C
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 23:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4782E1F03;
	Wed, 12 Nov 2025 23:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGt8fL5h"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08172DF136
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991610; cv=none; b=lPBP4mH2Fb08iTOH9HhiwC4XVeKfVSJBibvWY10/0emUzjNqSuxbpZEDoFwgerb/lnSh7rKNdVo71eTFQJvVV3AxeaAnsaMk2eskevojl7wEJgc4S9RZkDRikAT07SYYuTwLME3bYuRTxEsLpC+pwFJSKZmRF24OgUsMnDo1s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991610; c=relaxed/simple;
	bh=1oh4kdyHSPaK+b9pJi2NRh2Nd8VTsArQsjrm7EcUryE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSU3/rFKpMMLVaatVMiwglCY1i/dUKxe2mcPR5dEGBppgmpF9yylyA0Zac59J4E33wnYuKlNXAxakWI9bEqMK6sVy3JMVRbcIDu69Z5MgZhO80ojfD7c/g1VNFcb0FzBoNqq0a4SRT3SKVe1lH5afoPk6uEhxY0nxnOh1lk+ZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGt8fL5h; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso135253b3a.3
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 15:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762991608; x=1763596408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmmNifhpcubbDE9dZKiYrF4P2VKB8IFtV9YZ7wRcTbI=;
        b=FGt8fL5hWs9oN0fWW1GMskr3lGb16/Jr/VWopHPt1Gr9FJE/aXvBdzUmY3n34TEC1T
         Vh565k4JoGV//TELlMhjWYb7Ch5yfDgfI8pH4KNKEfVUtbmeHg7YIxiXklJUUtHmRULQ
         s0kD6cUsedhdqsuKyIBiG3+G2F+s0Bs0v2qruot8pRLcrQtwZ9GfPJGXGjqJMTGCmkbT
         sX2SB6WGACeh7UFOwmSVLFvPaJBD61Ogtj0ceEJynJmBxL5BqKJWsdI5tbcstqUtyCvw
         t/wSsVSAZ5Ma2mDUjBi8oP7SS88hKfeBxNj2Fx4c4eEEU3aJZ6p5m5rfKYjwGsEevq/n
         7TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762991608; x=1763596408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmmNifhpcubbDE9dZKiYrF4P2VKB8IFtV9YZ7wRcTbI=;
        b=L+Hfi3JjZBwJIuBwfQ5gz4g76dAMwjpV7fkwXwjeGsNA26TuGtre00RTc0YiuO9uPm
         U7i+9eAnx53leB4uAPuM7l2R7Z1GGot7jBNegSB3JigEMUeucBXbDGfsGhOkSawHliPd
         g+TCF9NieXdgD/kCVxKsT2uJPuKl0bN+qoOo44y7ZyHUKVj4S8rXzgl/B1TkY0MXoJrZ
         +K/ed4BHahQJ2e5QmmhMLxwX3sQU5rDRbbPL2myy/IQtLq50vtymm0wwAj3QndfW2pxL
         ilKFPGZF0E/OcE2SrJMxKemXZVCy4O6LJZNmwVnoK1IBtLq+nh4bZ2027upnPpi3SM4V
         IdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOLVjvopH0RsIGmRjKczO/IbNTyBVnMQ/7lu5YQ9SOF0aKHS9DA9bcrCz3rcZzqrS67SgE54StvfemIAzlHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMltsttJLwNPtYy05HIlwJ7ukDEw2f6F+R3eQ6os2eZv/3Vz3
	9N12JEoc2OcgPEEp1vg0HESGZi3zZXlZ7BSsxLDvdrwmjReDulT6Rn88
X-Gm-Gg: ASbGncuR2eVP/EE0lGY9QS1eqqkuzuvDSVdbMfq2/ufV5NqBNpFFELWl/kG9apji3I5
	481kLCP3RCmj0nNe5PfM2nGEYgctmiVxUjkbRzyfnWDLwVUw3uyRFpxMZcOqUrGG2UjVLE4OF8w
	N7A40yrnL8epZNKZO2lUQ9Mz6/SeX4f3iaAREW/Xgwex4vXzNfInTkE0D36+QuhroQx+fDnH9BX
	ePIB2rspOBkRr5rohRBmZgu60G1ApwESBQjDNpfN7QfNtIw7/jzT39NFlJtc73EcKaC/PGlyobT
	3M+JnFRRGwsvjt/ctHvq1BQwupJRJr2a0fhHXbB4hEdA5UuBsutWtn2VdtCzb6PZHT2ochSk9U0
	4jX5qxC9MtSSQv6dvUCt6hw+OA+8VyBbhD4F/K/FxiUZQJN6+s6es/VZAiFoQsnyH1fzAFNV7AT
	O4+3Yz2Sh39psk
X-Google-Smtp-Source: AGHT+IFgjVC8Vixif7sXqQSZ4rTFRseItczPfc0Wpwx5dz8YYT2ndmfeYyeuO2aXuPaCsvXZJFRH2A==
X-Received: by 2002:a05:6a00:1815:b0:781:17ee:602 with SMTP id d2e1a72fcca58-7b7a4edfca8mr6079755b3a.28.1762991607917;
        Wed, 12 Nov 2025 15:53:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm218358b3a.8.2025.11.12.15.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:53:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 15:53:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/5] watchdog: loongson1: Add missing MODULE_PARM_DESC
Message-ID: <aa2ec413-628b-4690-84f3-03ac1c435ffc@roeck-us.net>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <707bfcf1a45008ecf5c8d517430332a66d4ee758.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <707bfcf1a45008ecf5c8d517430332a66d4ee758.1762482089.git.zhoubinbin@loongson.cn>

On Fri, Nov 07, 2025 at 02:01:27PM +0800, Binbin Zhou wrote:
> Add documentation for module_param so that they're visible with
> modinfo command.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/loongson1_wdt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index 0587ff44d3a1..8502263b0d6f 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -18,10 +18,14 @@
>  #define DEFAULT_HEARTBEAT	30
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
> -module_param(nowayout, bool, 0444);
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
>  static unsigned int heartbeat;
> -module_param(heartbeat, uint, 0444);
> +module_param(heartbeat, uint, 0);
> +MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
> +		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
>  
>  struct ls1x_wdt_drvdata {
>  	void __iomem *base;
> -- 
> 2.47.3
> 

