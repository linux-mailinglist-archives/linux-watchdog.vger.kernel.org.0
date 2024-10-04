Return-Path: <linux-watchdog+bounces-2087-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566009910E7
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB531F22CDE
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBED81339B1;
	Fri,  4 Oct 2024 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMm1B3hP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16C231CAC;
	Fri,  4 Oct 2024 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075191; cv=none; b=FqgbF6OlpiKEh+X8dhfaTQpUDFqtDSdeXifvCIGMw1CaIwMfquQGyivy2GRiRevWsnERd1pRvXak4+Shd+usHpkt03R1w3w99tLj6FzZvNaav2q3xt4guNmwXQ6uSsUjOxgwXkAqEVCGbem3mhKC/BUtzW5gJMiAoDkirHnCFUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075191; c=relaxed/simple;
	bh=M8SmPSiSRz9pLsIkDN6cSdyrkyBEevTsvNSOf8TRQGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Siz+kngnrLKPzJDi7hKJKFu/9jvo9faXoNb/tDs4uKeCQW3LQIXoo9CK3y0oM8ZWbjPRjkYUNkYOBx/ZF/PfhUucN74CJOvtgYe3rsoxmRZHNvFGZgFyjzStZj4X4w4pDupk9iH9HWkdTJ0EcMwG+bToGX0eXkYj1TEsipUdDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMm1B3hP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71dc4451fffso2547897b3a.2;
        Fri, 04 Oct 2024 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075190; x=1728679990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLYRX19zEeBxriY7gbrtzdQC0WtVSdFsg2TMtzXnKLs=;
        b=jMm1B3hPHFgrZz6Q0ruxHBizKWldpBeI1CFTYxSaX4wULWpM6FyvXyUAsLR/8jM0Zr
         pthadl8fGsKvMIhpSwn7xK1nKkt087EXB8YJ8ixqIPeBMHDdVYkYxAM21ViI2XkHl89P
         HFGMN9x5hXLBuyszCO/Gb/nDpe/extN0FSETg1t4xdzI543kYCPYgc6ZNU8gxXmgFx4K
         MrI/1rf5mCmA/u+4lMrCZSNu4aLxK94/RLvbWBqfcnewRhKBxYWunjpo1zHtpa2LHs6c
         st4+XjjRQC8B1npOs9KzBhYlTlyJ95LJKGvSUN3uZ11z7qVP96yt57ROUF/jjYBGOYCP
         Wtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075190; x=1728679990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLYRX19zEeBxriY7gbrtzdQC0WtVSdFsg2TMtzXnKLs=;
        b=jv8OP3jQ5IHclKGahmx7qhf5F1zh3Q7shDKdfb3TDNsH1GUTFo8ByfmzEBGgiHQXgz
         +72nlQsxG1QWLLEDJaB304GtnKcJ4cWYj2YHt/fkWIaWI6H+YKa73mkveFrdrGR/Ms7J
         aUZptuzsaRhFQuMSFTHpU6aAkBDaTRaZEjdQn+wREPWU6aAH2dchy4IKMpCwlIqRVUpS
         pEJ0sAc5t5iwviW/La3Nk1CF/rphoNeDtoT8gLmsacTaMHc4oflDvd/gvS4V+GoJlX7Y
         oId+2Ay+cHBSlWWKOcZpV098Ce+/oambNdyjQU8x5EfQZX0FfuvXSEjLdCaYr8s1Tx5d
         k59A==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZHbLnmEgfk4Jl9GL2redoPUwuRZqRRnHlyzWc9stXl41KzDYbamy/LlYaucWEG2MXMs+5p1W5yg+fArzYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNbgNk4LUh4MS5k0UBFn5fxE2S7IWTjDYmNSamJT+Cnqhmg2Q
	Fy8NrSNOr0Gnay/2H/dIxiN6S8vSBH7dLR3UCmL85ZJAfJ/6/APCpwRpwQ==
X-Google-Smtp-Source: AGHT+IF1uLQzu9mfBHp0mTn20bB1tBjnanJhuGVqt1UGspjUz8AG8wBpdlbUe2A920qZt4eu3GFaFg==
X-Received: by 2002:a05:6a20:9f04:b0:1d5:14ff:a153 with SMTP id adf61e73a8af0-1d6dfa3600emr6354767637.12.1728075189660;
        Fri, 04 Oct 2024 13:53:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbf346sm303422b3a.29.2024.10.04.13.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:53:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:53:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 2/9] watchdog: da9055_wdt: don't print out if
 registering watchdog fails
Message-ID: <49153def-0ad0-4a98-9272-b4ec85cd8ab5@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-3-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:05PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


