Return-Path: <linux-watchdog+bounces-1449-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEE947E2E
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 17:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FFC02813DD
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047A155C88;
	Mon,  5 Aug 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7VXYxch"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCA1514E1;
	Mon,  5 Aug 2024 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722872047; cv=none; b=fZBgHspFk/vMptqZe6qJd2/Y3TTNHB/w7V+G+eEG0vZ8ch8TkyNVmUtE2pN8K73KfiTbzWGGm7bIrk/SNdLgBDKKCQGUl6Hq9t6my8pJebbtuoZW2rUMknnC1HFnBDPSpxHjFBeq9y5l/8pFCCpuzxJxDglkxoQyARVeHFsq8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722872047; c=relaxed/simple;
	bh=0yY3lEMgpKaC8kkxZ89YLUnkpiljb1XkrWiWAkcccvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV4hqRPy4Fu02V2LLcnAgspLsFkB1lC1P5pdGM+iJi7gk+NR3RnN7odn5M2h5HbPn3i8xdsthRRi7LTRHEmf/aqREcEzTmdJacAcXT8X0xgG6suU5fEP2rR4Mr5U40PkOxOqmNCRvi5UKNBVE5IEa8qt0WgT7DSlSTBLjRdnKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7VXYxch; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71080f4c006so1448922b3a.2;
        Mon, 05 Aug 2024 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722872045; x=1723476845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sU4PGo8fy6Jt3l07W86KstlfJmCRvZ7xUO6ToPjlfo=;
        b=V7VXYxch9E7hPQIfyKgmsU+f3eh/41QGocMONgbUg0vMI8rknD1vHkgMR/1NhYj5Io
         IsdwsFFo2orr88RKNT7yPYUkoJ40g0Zb0zra68N6CWLGv54lcI8cglzvCYQY3npueQwZ
         i5NKNBZN58PDPt7mEEpQXvCqf5LokKjMHkl759uGMAvJmD2pgZCPerVz8HoXZecOTrHH
         FkRvp4hQgzxkIXx+vLLOKz1cCuzbDcqvGGGP8jn8Y4Zu6quZeOM8pTFRmmdWAdP+kA3J
         LD3wip+K5YnJei0iD1mN3yxTRd5M+fiiwpKiVDhvdLFt5eD0Omp08iwhDVAS7rrD0ldx
         Qk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872045; x=1723476845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sU4PGo8fy6Jt3l07W86KstlfJmCRvZ7xUO6ToPjlfo=;
        b=atvMr/C9PWRzOqdfht1fX+UKTmkvHflmAIuzBmmp2mEHbGR2ITUuq1Z75AeafbOoTq
         A/uMlEQvN127UKMDvDyQrupoc7inh4PZmgxTYJ0SOk4nOw8/8BbwA036+PYlnlq5lwpz
         Waj2e8PKogkaJu2Px2fAfrHXrmm1miEo042L8dojSdoJ0gez+ngM7bpT4ruokgfKZgdH
         D7dgd5XLE6gJJlqFGwo0CR9H13DXI2yRSXP3LendcRftaKik4iyhFvvM5+n2zGn+kDBp
         K6lKvrcITi3m6KSIG5xhnM9EIkx6nr9Tczse7ABU3iQnMfBy/EuiNfLZO5p33GAH3XV1
         xNmg==
X-Forwarded-Encrypted: i=1; AJvYcCUH2R0ps7H7077f8wSRmyZ0+8t+qlo0R3AVH7BDI6EEX5Lv1pgKj6t2IViJ6GJAOcfjq73eD5D/RMG0Ea8gy07uF+yZfs2L9D03v2yUqVTX6VdNNFf601UCcyw/wV50UzXRwauRfuMWHXS6xpCWdrp7Kln4NmE00LFqMUwHX1+D45El+YIRloeQ
X-Gm-Message-State: AOJu0YwrxHnUrVWUANhaLe6p0VG/sE2sM3Q8FTDb56yYc1284G4zmsI6
	qaUzt1IMzGA2bA4y/wHarXBNabDjLByOohzGtA5dnIQyxvMhBYuW
X-Google-Smtp-Source: AGHT+IFuz3AKvHjT5Bd+0O9iMquWTF2q8Qgc1xKKQcVhx9U94bUyiLXSNL396Qym/b5UHvm5z2YYRw==
X-Received: by 2002:a05:6a20:c401:b0:1be:bfa2:5ac3 with SMTP id adf61e73a8af0-1c699659713mr9832432637.35.1722872044999;
        Mon, 05 Aug 2024 08:34:04 -0700 (PDT)
Received: from five231003 ([2405:201:c006:3108:7aab:a809:87c8:7090])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed14bc4sm5722310b3a.171.2024.08.05.08.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:34:04 -0700 (PDT)
Date: Mon, 5 Aug 2024 21:03:58 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ti: davinci, keystone: txt to yaml
Message-ID: <ZrDw5ui+Buki1Lgh@five231003>
References: <20240727050736.4756-1-five231003@gmail.com>
 <ZrB6Cbe6JBxFPRWn@five231003>
 <20240805144410.GA2483419-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805144410.GA2483419-robh@kernel.org>

On Mon, Aug 05, 2024 at 08:44:10AM -0600, Rob Herring wrote:
> Note that these 2 patches are independent and go to different 
> maintainers, so there was no need to make a series. No need to resend 
> for that though.

I'll keep that in mind from next time.

Thanks

