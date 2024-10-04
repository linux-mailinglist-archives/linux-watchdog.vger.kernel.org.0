Return-Path: <linux-watchdog+bounces-2088-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5099910E9
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943E01C22C73
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569082AD11;
	Fri,  4 Oct 2024 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoT8Ezwt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD72231CAC;
	Fri,  4 Oct 2024 20:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075203; cv=none; b=H1vYzEABPelYLZPXy09BYbyHmmg0DsGGjmtXYPTjoY5gH8rARP4+OtydPOXSp/ynXlL4eIDrssgm8hNZ5SrYTjzu7+AMAbZa42+MwL8ejxp0HGS6ZyQ+uTwOk5Up3FTyS3QplX5W24NHl3DTROQuJUY5RAmO/fP0ZFQC7oUKrXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075203; c=relaxed/simple;
	bh=6PSQ97eU73fzmFZqz5Gd+uVUpnH/WNr0ClagXE5uufE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcjx2r+a0Sev2Ye4RnpsueeLI/FmJhyQEC/KMUWlrlAAYnCbrQcO+9O4D6pGrwtKSIf+bIcXgQVN6xFwXUNzQNp8QKDk/TWlj/0/ys+h0i9LpJAyuWbcM1msEeQf4+wkrTGZzyZdzWIWPOqdDvSyXFfKLPD4YvvLA/c9QVVkGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoT8Ezwt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20bc2970df5so20214425ad.3;
        Fri, 04 Oct 2024 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075201; x=1728680001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smrr4OkXwVdqk6XqpuCyrQR44A4+AT8djKxvV48bI+w=;
        b=UoT8EzwtkEybykf9MG6R9KigkaE3c+19TxIXrgna9HQghc4BkT0TBR+lVwJAA/57sI
         ReR24zxTW/8LrXSNKJMrf2OikWLlQZ6itx8tu61LyalGdEOeP7HsvHi7fhPfmAyDCIdy
         nyjVHno8GG3E6bey1hDJySzfnjdGMfuD0GAHVJDweAMmWVPiOankI67c/aCAh4kDAG4h
         8Oc+Z6hFM8zHPV0uMUIoPWix0VJsMCBZI1KJJd0obAxpAdxEBXHjk+LHjPZv6YvkFJqR
         GkEBrfh/vvjmtBZ6jRwLYap9s9jbjpsCI8Osy1E0EScLiJBODrWXUi6iUzi1xmH2jaz/
         uXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075201; x=1728680001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smrr4OkXwVdqk6XqpuCyrQR44A4+AT8djKxvV48bI+w=;
        b=R2OaR+PWFhb21XcMTdOA+75RngYC+ngZMny/fEjM55Hshs+zb74Ry5vPKdFrk+yYuv
         X66jDg3cKg53vFpa92FaMdVg8/eCGTEqNII/vqmrLWCyLPynmx8JhNqfcyjbHC9EWjkd
         MDa+093WeAest8TBkmF0cJgMMuhX/d5Jb0SRbPIBSV1yBl947Z1MO6oV4B6F2mMrWhQB
         R4xAa/zWiCFg7ZQH5FjXFAiuVxymHiqSKp3lFuSWxGWv7ZGraXNu6n2Vqn8w5KpzrVja
         N0hGsNFqUnECnCegcdBGGkVk2R4R45bCQqHTAeOoSXXSnqohXI5MZf0VACm3VlPUv9Xa
         LTxA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFUPge87gpY/Wwboe4U7SIrRt2YugMnDyj7oAYEVO82En4Sh0irWwxqBYJMKjbZYL+jzc9Lf1vgHdrK+VSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/M7+8iOGx4SaGHsA4a8RgsLRbvnE3LCrXKUOzT392U6QfrmT7
	1t+0BoO0/OYgNC/i98UxRRvDIvhFV+LOU1vweB+nDNzT+CUtYuIb
X-Google-Smtp-Source: AGHT+IELXUNuLaEnfKZ3dOF8394kBVllbuF/fsiKNLyOhDvlocDjTKGVMYJFgIbRSzX9OEtgVfs9oQ==
X-Received: by 2002:a17:902:dac5:b0:20b:b132:4dec with SMTP id d9443c01a7336-20bfde57e80mr68956535ad.11.1728075201283;
        Fri, 04 Oct 2024 13:53:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138d0ef9sm2694725ad.98.2024.10.04.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:53:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:53:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 3/9] watchdog: hpe-wdt: don't print out if
 registering watchdog fails
Message-ID: <432ed88b-0b8e-4fb5-880d-129663132a66@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-4-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:06PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


