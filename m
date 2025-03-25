Return-Path: <linux-watchdog+bounces-3136-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC8A701BB
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 14:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B3C9177422
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 13:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3E22561C3;
	Tue, 25 Mar 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goVgUeqX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D6256C94;
	Tue, 25 Mar 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907931; cv=none; b=R39y356kT8DH/xs5iYnSyixViIm5Rc9ptNr8QjqQEl1W3o0E7+aAvtWYYiiyr0GEimO42BhaxnDC5u82crgpHjYC+JxllwuFOb7tauxalgatT3pqCfR0ninNmGblOrG0P0S5tjYTJC7CxAfxPLjGOEDHYDId/MT3YgNxd7HKgv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907931; c=relaxed/simple;
	bh=lHrYxTMv6Fp5NLUHXBVGti8+WDVNBNXlryKh88J4Ins=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5EBNzTZf5x/o7ylOePPUpwJIFBuOIneRMWoaCLORVVjwEjXyNLmz+UUYOFa9/LF6EeygDaPiNkOoX34UJj3A5B0LePFsNLRPTK+Cs3eUDBhEIWaDQKviZPN3A7NBi93cGkyhzedi4oxXdqtvPAWdMyLOPV7o+flAotTfQjc9Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goVgUeqX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b828de00so42363015ad.1;
        Tue, 25 Mar 2025 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907929; x=1743512729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dG03l7pS1fH2fHYFIX+AmaR43QatceHrXwvTmN8/ZX8=;
        b=goVgUeqXZB5QcqwYzfMZcPRoNeWIcKtElvhNSxbV5xmgnErh1CqjRlELLwNTScg0oR
         ibOmM1i1KRAdL/9N6u3EJX3XXNeUcTry4/2ZWnxh42erDdSDJbWU9tzK+ZE2n45OtPl7
         Ie++ahWxU5qr2yE2l7eDhGtk79JEamf2z/N+N9W2ped9bVp31G31VcsTX2gpqWK1uxXI
         b7dRa6DCgJxsi/I704dOX8PPX6XvHas9Pexsm4/JfSa5CdiHckmQGOkaTIzPX6Beizfa
         aYjWpdJTf7D8XNiBeulKnDUjSDVkqP7XjWXv3h9LOF99tr5irY36IDF9WIGkae96iTpJ
         2M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907929; x=1743512729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dG03l7pS1fH2fHYFIX+AmaR43QatceHrXwvTmN8/ZX8=;
        b=vV7NEb4fIljXR38iIkWwkpaAjWdiIkCzoF1K+w5ahm6tFK2r/xP2Ndwy1mRoO1JUHe
         800l7gGBxdhEuzHHrH3Wmfw2CcrnOk+qjHxVzJMksE+l3dpZY9tBru5ulJt9T2cgVyvB
         rTJQ79HeWUOT0MFJEatJ8Rk9pt4sOYFt4VJMFvvfCO4maPTHv9qIp8+2s5AWAM+G1Hdb
         vnulk1NBFbqyezrefGZULzdsjhWLcFTPe40+mfoKiW9TamH200ypz8GxQEB5FZ56z5wU
         /1OahCyKuolAq/BmBmKWPhSMpKDpVPPIWXjjeKDw6SQ1H/77GJgpbzJ0lNF/PsIIzbhE
         kzHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrygQgcc7QsT4oU1f1pk60Us+lf6C9dRv1zLjH8xmCy6NeHO6IW2qzpTjCJax+MSFrQBkOrwrF2S+PhbGJRzg=@vger.kernel.org, AJvYcCVJ3P7ZxA6Vg72sNC+IMNiXyPqjfeoAYMEm5DYBe5p9GcY8Cs2kak+65BRi7bCdrTXmtw5nqZddGyyI6rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0hZcO6MEyWeNWGgfbN070jGvupNqLC6k19dnXUfcJ57Fq05V
	EHQscuUBDX5Ia5ye2raJJIByQrbHoIs/C800lfWymqYs0Bor54ctYtiY8w==
X-Gm-Gg: ASbGncvKPI5FpASW0Q9tNjdpgY30RN7AI697T55Ocy/K5pOtFASLdG4IMPBHsg6h6sS
	xBhRA5n3+V7EdQmRD2/MMMPvdYMqnCu/g6JibgXH/5uAWL/tzoNCchXMbZs6wLsXixadYSF+bIq
	ty1hPzE6pkjhn2iBWBjId7aL/pVEE2vFraBneEnHfc3Gwm5lqKXY8lVhAYpHhWBdD/pK4h3g7Tq
	xHxZ6GrF+KnmJf39TaS1O/5Pg0txVvhq0uLyWgH7ZXpSEJdsJJ0xgeFiwcol6s22d50zLcPMUBH
	N886n4x9WYinvOTKq2lcEGAJT7hMmJ3TuVQDVMOS6MJ83tEkh479rldftQ==
X-Google-Smtp-Source: AGHT+IHajNvbe4+8QtcErZWX2tSl5xBD4TsubmiwSV3IF+txKIAovFVExQBzBo4+0Hjp6BYEc82V8g==
X-Received: by 2002:a05:6a20:c901:b0:1f3:345e:4054 with SMTP id adf61e73a8af0-1fe42f32676mr29936084637.14.1742907929393;
        Tue, 25 Mar 2025 06:05:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4da80sm8936192a12.74.2025.03.25.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:05:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 25 Mar 2025 06:05:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] watchdog: da9052_wdt: do not disable wdt during
 probe
Message-ID: <4ad7cf57-e37b-4c3f-9ede-644b95a0cf28@roeck-us.net>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
 <20250325-da9052-fixes-v2-3-bfac3f07b4a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-da9052-fixes-v2-3-bfac3f07b4a4@gmail.com>

On Tue, Mar 25, 2025 at 08:27:14AM +0100, Marcus Folkesson wrote:
> If the watchog is started by the bootloader, we do not want the watchdog
> to be disabled.
> 

If the watchdog is left running, the watchdog core should be notified
by setting WDOG_HW_RUNNING. Please see other drivers for examples.

Thanks,
Guenter

