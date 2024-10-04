Return-Path: <linux-watchdog+bounces-2089-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7D9910EC
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA191C22D71
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440921ADFF2;
	Fri,  4 Oct 2024 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBF5gtTH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63EF155C98;
	Fri,  4 Oct 2024 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075219; cv=none; b=YNVeeXa38bD0aoY6x4HlJszdnsBKkBeQr4nOr6IXJlTXb2qafUUOez8auhnLEsk8IyJO+/W0k/AhMYevWDNdJeKwj1btPOrmhATo14QYXTl/45S0uxIO9MuWSSXwEwgJW8cxWJ2aVxJAPMr12s9azFtGvRdjZBu/AnIyR4/q35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075219; c=relaxed/simple;
	bh=XREcEqgsePZQfvwlVgDQgax1JZcS1F5ir4Ln9/uXg0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+kal/P0c/UaA3HDAyOqJbTaZkrP7vCyGhvjsDJnBmJ6rNzZpHAgHlPe4PRkdVpISUvxTD98jw+cWkqkwMSpPigGY1tyAtAkZUYCehkqye8BMhEYDeMDTQ7sff2XV0ckjL6I8RudRV+G/dhh3YfaFyclurUuE7rE+EJ+FuixiAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBF5gtTH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b84bfbdfcso24603715ad.0;
        Fri, 04 Oct 2024 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075217; x=1728680017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcoZItrN9I3BxAoyYm4rir0BJCG00dlYgS65v8q3GoY=;
        b=fBF5gtTHtJJo4GQO7rIwxgd4z7FWnZQty513+yoCdR90TknyTGuYn051kYH0U5RJQi
         hon9lgH1Wx/x3ddJOoPUOC4NNKFK+rerS46I1xNg8r81kLBlJ6E0pUhs0un1PmXcnODB
         qk8uEf1sbxRHlfJsMnZEAwBhEFDAE/op+5fKLxlLtUz21sCIb6hisaTiLZpuqsIS+89B
         arg7dCiSjopv/O19bdCJA/X4Ml+oaJMpymdyKCxU++HWRsqd3IWSFFtf/DqNxKO9KXAk
         BZPEqu9ThInZybNOBdJEUDXRCWo4xJpvIgchCMrQKFpNCG3b/jq80Vn4kSKsCRyYfShV
         oyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075217; x=1728680017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcoZItrN9I3BxAoyYm4rir0BJCG00dlYgS65v8q3GoY=;
        b=Ffu/Lk/W85zaOBreetKCzYoEeuy1JUvWBa7t5MQfRkfVsv43urQnoE0Ax1k1Gf8lm3
         uhYJHl5u8eUYCQ2XADmRiFKcL/Cu6ZSghbMafTQWPctLKG+nz8AG1+yszCnCtsWSg5g8
         56IKi4PewHeFTefv4kdj5WKq77+EgwD2bLTg19Dpjslp2an2QlhpV2YowbVv9+tOfbJT
         ul4E8DSCszmZO/dvEZtkS5QtFfWeGT7eL8wdWkf3HkkQKSeBoJy849TN8fWAPTi/MCrl
         7lB8CG75akgmUsqoiB079NoECDk41Cd8T2YCsq4jRDBvVxACL9VSpoZ0DiAOfys23sj7
         fdCw==
X-Forwarded-Encrypted: i=1; AJvYcCXKc5TjcFr9VkL/Lg+8X7SaolqYg5Bp8QVTXrEkXkpeTImRQTawqIgYjytI1/h2is47KfUGfuliHbh2259SZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWaHYkb3yFEJlGXwZtAkqUebalV+/bEFCoPRsXZpprU9i/wH0h
	yXLQRf9I/xQ+ctUqT+wecDJ09gSv5YOZzrbfPPsUm4pX34RtHaizJ9nvNg==
X-Google-Smtp-Source: AGHT+IHZQ9n/U8pKeDqDmeGiH6OFhSBQ7MkPtVxKb2uK0cvfTehilyJRBap6yhhadyZ3+ZaWzTumVA==
X-Received: by 2002:a17:902:f683:b0:20b:5231:cd58 with SMTP id d9443c01a7336-20bff4b3472mr69426035ad.16.1728075217023;
        Fri, 04 Oct 2024 13:53:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139a125asm2598185ad.292.2024.10.04.13.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:53:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:53:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 4/9] watchdog: iTCO_wdt: don't print out if
 registering watchdog fails
Message-ID: <f3155958-b579-438a-bfc6-1d95a7acaae3@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-5-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:07PM +0200, Wolfram Sang wrote:
> The core will do this already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


