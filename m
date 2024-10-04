Return-Path: <linux-watchdog+bounces-2090-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 432769910F0
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09631283C34
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E603E1ADFFA;
	Fri,  4 Oct 2024 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diz4M0uF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7C231CAC;
	Fri,  4 Oct 2024 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075236; cv=none; b=JFGvGEfFblJDeWpSrprQs3wT3OLXtFDkKTzNyDJtGSv/+Q05EnekDBNnd1FmUqqWnNa9n1bPYpEaBl0PWu9vvv6U9QzzGBw1Rlmvo8PjrteFZDXtJ7EtiFzxxTJp94HlXmHKGDlaHEZ6PkeBVDOW4F/ZZ3hMoCRiO7+j3xnQKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075236; c=relaxed/simple;
	bh=gG2taE1a3s6gJN9BiAtYauk+n99AMQYvo/iGEJwExMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuXrMuC/jplfVd6VwVVTebRranhM09JrO8ksYtsXGg6z/11+uRuErw/PRc631UwNnzbn2QQ4LE7nM6o15o6Bg1pssbCgiRIzwt5SNmygU1Cg0mCkOIj55BspX9rDNlVg6NRZbDiKWEux4M/vrhGnpGmfv3aFv2rIsCSvLthRAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diz4M0uF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71de9e1f431so873711b3a.3;
        Fri, 04 Oct 2024 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075234; x=1728680034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rg9/ojqJxd+TTSdzOE4SE7g3d1TecT6HByCLWM2R8UQ=;
        b=diz4M0uFi0ZoxlX/uUjSp2tipXnWWl3pNjab/dkbzrM4P6mzuEHgXvBItYQ1MXOVnP
         Zdk0rkgH7hs6PXe4YJoWC/VLi5aCFqFb3I8Wm6zD5tmEJqbf5e47h1DQDCY/9FNNHS+u
         7KkYzWt4KixlIt8Haf0xfV1czSzcFkxxYZn2jHuIDfw30hUkVCcva9Y6od5/AlMD2VjI
         ygdvlTryOJ8lb/hU5AOUoeegfkVsypHXdGHRksNFWr69xPeblQL+odWv72rn4kDMqqPO
         KVoNPkFtaQtAiqk/12teKxWPB+3c1wpnKb0h6PHXkE57hMljtJtnmTaY6/kPaArpkVCl
         JE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075234; x=1728680034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rg9/ojqJxd+TTSdzOE4SE7g3d1TecT6HByCLWM2R8UQ=;
        b=PnWs9OzdW4ciCNDugX+UKA9o4ilwpHYUGi3+5gZDkZC6W01HhOmBAR/0iowC+ZeW3j
         MibraKJ9RkKZegxRoX4EY0Od49L6F6g5QuAoFPyaX431s1elEWZW1/KiHHAGd9JYB/HO
         rlJLp5wsyRIXh1jK2zt3eWqtcHeQ40luYw2L/to17X7JblBQC6GLRBrjcAXmrXKLA3lA
         2gir9tigPLXFa9S8kUPxWeSyhKTeB3QKXXosh9I/lnJE3br2vNOpwduaO8IEZ823bQiO
         uw4S15414EyondKmHGaixPXaz7YTmmaQAWcdDcyoh9RqL0B4zWxvx40hiqN0XCnweYtf
         JvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLggUbut+2t8+HEoHzE9XYyE+6JAHmd/6JntS8K459i6IIAvkF7MmAHFjwG2UXnTjE/cEFNKBBGenAyUOG6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjitzFt4Eyw3enJmD+WYx+7tJGfqLBh1E/+J9/sXGBpi4n0buM
	xYO4VWA8Qry7lTHmsnFNsUNwYdVjhGrMT8zceqXGWd3OvJkbOla3
X-Google-Smtp-Source: AGHT+IHn8v4Lpp0Glhy0TQyeMh+nDDDoqVEK7mSNtilg5Ubt3T1DxkZxlgNHnhQvvJpQH7mpPUnO8g==
X-Received: by 2002:a05:6a00:cc2:b0:70a:fb91:66d7 with SMTP id d2e1a72fcca58-71de2445487mr6360928b3a.20.1728075234429;
        Fri, 04 Oct 2024 13:53:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbc4cfsm303445b3a.38.2024.10.04.13.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:53:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:53:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 5/9] watchdog: it87_wdt: don't print out if
 registering watchdog fails
Message-ID: <acf03813-b808-4d9e-bd97-d1ba59243a13@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-6-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:08PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


