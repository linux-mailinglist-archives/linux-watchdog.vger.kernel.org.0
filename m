Return-Path: <linux-watchdog+bounces-2092-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D51FB9910F6
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84F941F22704
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62667231CBD;
	Fri,  4 Oct 2024 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS0TynmS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41E4231CAE;
	Fri,  4 Oct 2024 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075269; cv=none; b=kKs85M69GJiHcfaunod/+L7mXxNfmfyy5k6O4P5lfC3Pnug0CXQMkkcGojiNlVuzVtIGM6HAALswpKRRqPoUE28uEwunzQmqHop11K+dPy2YhVt9gixmzvjQWdi8YvU/vu/U12QjQzDShIEpl2jmYktSvQv3RHY937H2U8XrFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075269; c=relaxed/simple;
	bh=bQLMqSA8i3QcQ/2TT64vQ7pN1oBPd2L0Im4JfR+FzaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyHi3smtkosk1CwdWEOnmroE/PtL/sBkt3qL8XYe1yt3N4Jg8bkRKIoHEDwnZdAwD3aa0dOFaiwFFuMsAL7NzK3cFqLFZ9l5ybtZsatFpHLrIWzR1hdEdjz2I5tonzEhL6MhXsGMd5ghzIaZ9wgiGfbR9p+TwvLeYtaq/qj4bAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS0TynmS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71dee13061dso597150b3a.2;
        Fri, 04 Oct 2024 13:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075267; x=1728680067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZCqStoePt8TYLUNSiQENwfvfv+Jdtbk+1k6wdvHmlk=;
        b=nS0TynmSJUara36QnjcbGgNH9r9nrcZb1Yh1hiXehWOGmLmWWn3mnzFK/JZdBv8x++
         drknPJt6CjaW2OZS4j/zsPSSlhcBT6hmIMGl1qj8694VbwTxRXg8yfpIdb6uEc/Vvcvq
         X6/vXTCg4xpjzqEUvxEnDvh/N9xGGtfekHryok06wiN8KLBW+pSphNsVxD2JnLDEL315
         jS1Kv9owGR7Yhv7FcPpNROpkVaQ6O1jpBsNQBuqgVLpltWc4gtJlg983qF2q8msITWcB
         gAgomyUTLbBlRkOC69lrMS4adaeM8UwL0iemVFKoH1wfdifBof/coQHjl6WeqhLmAow8
         iOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075267; x=1728680067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZCqStoePt8TYLUNSiQENwfvfv+Jdtbk+1k6wdvHmlk=;
        b=TVQukuV7ImUwNse+OiiFYSIuIRpnUcRXS9WpBnMsLcb7sEyBzNWQ9luhcPPeQ2OmTu
         Zy3PrjJcJdgoOq2HEfJOg8vm+Jz3larUbY5X6TXCNOG/Uj4SYXcHdYl/iJy7pbPGz4AM
         7hgsIuqLJoKAcHkC7QdlxsKSBkV/GVPzkmcay2AAOVS60uxn0mQD3r1/d4+Obw291CRo
         ip7TY54P6XiVXWsvcnh7u392HLGJVbyj7bDNh/ONE5vlI9rQ8V0UTF43Ac67a13qD7Bw
         4g+irrLgio7uhztS3gPuyPsjJvb31vIdTIv/jATf/IzOxDZo0LcJLRZZq7zsvOepVjMU
         pK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfcrVHKHheWAGwPoOpKrhYhvZ2g3FLy4x6y3+KWXf4+hCK+StBnic/2Y0xx68GUKtV6Q7dNSwM6+JajbqVig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/RwFQ+nhn85hGA1RVxTj6oIP8sfOZiRkfJgn6QIPxzCc/y7Y
	uobcxsO2oa/+2MHaWT6utlu1vFtPftJHHcNOmACUyYsqBeOeKmAF
X-Google-Smtp-Source: AGHT+IF9Ki6IOyDBnjVdSJUONiCWfT5h4l6BDum7CLThUzvWt9cPFbQze+weheuEozUYbcBBS9+7AA==
X-Received: by 2002:a05:6a00:2ea2:b0:718:e188:fdf1 with SMTP id d2e1a72fcca58-71de24514b1mr6367508b3a.20.1728075267239;
        Fri, 04 Oct 2024 13:54:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd2a1bsm294434b3a.85.2024.10.04.13.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:54:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:54:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 7/9] watchdog: rti_wdt: don't print out if
 registering watchdog fails
Message-ID: <ea840ac5-d1c5-4e4c-a7da-e8ea222c075d@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-8-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:10PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


