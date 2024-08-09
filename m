Return-Path: <linux-watchdog+bounces-1471-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C794C8C0
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 05:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074651C22158
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 03:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135A417BD6;
	Fri,  9 Aug 2024 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Hg/SWZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593352FB2
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Aug 2024 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723173309; cv=none; b=utL1Q7kRFHuU8va0+F1/dJINKpllounZv+bC8w2RQw5BPRnynKM7IjajbRHDO6o6ZpHvKRPjSuDNwhOF0C1LnMk0E+f5Mh0IhipS2jKwFHKpNJtHslrfzWegeI9Omk1XPrateehKymRrq6hQzVQmRpsOCCXg8GXQSH5Pp/CvuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723173309; c=relaxed/simple;
	bh=NVNtEEgmTrCOcE4nhH0ytSorrqZ1XIQILuMKElvqHYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxfbbCY6QAbsMIqRNo5trwXtpbZl025wOV1EAqtjmpQQU5p6cuFjeBC88tUlOqzNrUZHTLorDoHAJmrPhpVePiCLSRXcQW+/a3p48lTnyB/i4A/90vUhLLwy74nmfOxBCPnbJNLiqNes+xKUY2KWVxVb/Je+nR6NQPyKdmGoK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Hg/SWZ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-70943b07c2cso1007217a34.1
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Aug 2024 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723173306; x=1723778106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JJ9StcdP4kL9BJnfdfIsKfSNaShBhDrqunyJsNYHv8=;
        b=e6Hg/SWZzQ1zji/jCPQ+Ukcvk1GTsrcBVnY79X1je9rfmrfH1vpGXbk8liNQiezM2A
         Nw06LacAZHa8KFghKG0zE+/FrNN06koEtqUd81g7q2U/Z9FqtupJVT1KkjADTlMGwF2D
         Xo+TRQrgcUgM5JfO9Z4N6utfQ18XCEuCxU6X5BSBtcF2ak2fIups+uSarCpvotySLAba
         k0avmCZbpu4qYuiMYeJQSY0e+C2ekiVI6wu18KUlV+k0igZj3r+XE/SBDRFZBBedO6Qj
         e8KjlTIHeIJzq97Z6MZ7SB1SXeRT2DMpUQWZ+If/tTNo8qU0cPxh+CAijS5QBKaFC5/i
         tS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723173306; x=1723778106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JJ9StcdP4kL9BJnfdfIsKfSNaShBhDrqunyJsNYHv8=;
        b=kvQvL267UDGciKkwvubO/Gk6xCfsIOGfha6PvnZTY9gWOEGq6SIME55Mmrj5dx3Nej
         uKQWlixCnlIdJ0lIkNUB4Ycw+M6aUMT0KYVZALKA9oWogqUTV7D2m5adxFyEhcpLboPV
         JbjJCfbRwREP3G2J+tVGH0dh6ZQgSTm1OYQ+BTC4lkfxttExafTlI3cxaGxFind98ug0
         pC2Pblem2+9hzGN+LBstUXeTK3dxMtsF8hRXGnfy6AH817vJeF4yAm/Vpi5gGVZH3sSu
         4eQBKShLtIUHb1PpIdf1df0i8AcrVSedU7zLnxXJCUrXaVqK39lxS7FBoto0VCpQxuWw
         JOZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsvegj3l524XVbC6Ekn26qlurhmAbG2emeh2a+T6nmrSYxZbO3XvnvgZhAzV/RDwrgNnixhtZZLU1JHEgvjhN5+nmCmeGyR6nCyWNIP3c=
X-Gm-Message-State: AOJu0Yz9s25AzvBVdF6xdZEEdBJdVmGab8WJBhZpKFanpLc1BPKrCcC+
	iAiG41hmBLnam9Nc2xfU+LlYFGXA/RgJmMgEj5JchNERka6qkugV
X-Google-Smtp-Source: AGHT+IFcddA9i1Jce/8RClPr1UUDZK3bjaw3CCWJtC//foiIcMT/VrfEVfc/PuaMj8nPMokwRjVihA==
X-Received: by 2002:a05:6830:448a:b0:709:45ad:8552 with SMTP id 46e09a7af769-70b6b2fd148mr385891a34.7.1723173306237;
        Thu, 08 Aug 2024 20:15:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2d352esm1779174b3a.123.2024.08.08.20.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 20:15:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 8 Aug 2024 20:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Remove __maybe_unused notations
Message-ID: <764b5cfb-5b04-4299-827f-a10a0328ea4c@roeck-us.net>
References: <20240809020822.335682-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809020822.335682-1-festevam@gmail.com>

On Thu, Aug 08, 2024 at 11:08:21PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
> handle the .suspend/.resume callbacks.
>     
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use __maybe_unused notation.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

