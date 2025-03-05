Return-Path: <linux-watchdog+bounces-3059-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBEA506B3
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 18:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED853A336B
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Mar 2025 17:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FD615350B;
	Wed,  5 Mar 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5Gom0Lf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA83131E49;
	Wed,  5 Mar 2025 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741196830; cv=none; b=fE/5801ony+Vdis+tmzKDPCLcKp8paV079hb9ym2LvxU8xG0/3D+iEjuSC+HSZE6G1XRjyF6H7WRSpxCWcvhankA7tzVqaLJEp0AoNd4TB9NyYBnu0xFn4XjclGXPzJblOZpVoJHvhZ4YTjfM6X5K8xscsu5gm8qv/O3bx31hkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741196830; c=relaxed/simple;
	bh=XkXAEdfVFTFjbILONsA+SnhCkrqCKprR5pBsJCMVQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHXglZHNMayUOEmUL7KM7XGzMO3/RGfXCaoDZ/Y+dXMJN/O1/Qq3HkkyvihVBty3a732BkONY1scIuXbbL/KaDwqFWAfmI5gVhAAqhyiPJ8RBdHr/WeT7PrO+k4xIuUSkyGfmGho/DHTWJJTTZgG7F6m4h4CdjV69vTWhOpfvzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5Gom0Lf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2239f8646f6so82632195ad.2;
        Wed, 05 Mar 2025 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741196828; x=1741801628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Estk+5gNY3mVuOls1Vw/SWWGxf9dwhMg24EqUjgvQNM=;
        b=T5Gom0LfAf95UTB0isy3UCAizrQrTyuy0c8Ex//W4ihTaui0Ou/E/CPHL6ZLeqnE+2
         jfgY4T8xv0zTfqu+r0oz7QPE4y15idvOcZDFhNIWRctYKW9rs0udHsxa0BYB0ledlIOz
         TyuvAt2uUZ/Wfc+YKle7Y/e1DQiSdgEJzBREcRNGWReAqjOID0C5HMYB7ham9vYEnzzq
         PAhYmRvLvIb3cIGoGhN3jRMpA59WoubXfA2Trv8uZcVO76b4C3DOK4VqwuhxNncjYujo
         m73vwFEx0rYB/sWJp2GC3kKvwzQBDPzxb1jq6mTFn9TwO4TPyPBb7DBkWK0OkgoM5AgR
         RqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196828; x=1741801628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Estk+5gNY3mVuOls1Vw/SWWGxf9dwhMg24EqUjgvQNM=;
        b=KaBvMgJ/vbqzpNF0Ejt45w72IhBMpjKl58Yvx6A9LmfW+5sGseogLX+5GVL0Ef2If0
         9d5dZ3C+IGfw7KCXvhHUYkN4p36NTFJWY48pBW80X63aSBJb/qVAI5Bz2dwyI+38as3o
         rv5p1lHG1Q4AU2mvdI4cb8FIf+NDrMfzhQkDDHG2sd7Mf4Cdqu9bRfXibApGx5tfswzX
         eaAuIaCP90Nzwlf12V15YYR8Brgi+ntZyfEAGwNF9QqyPvy9hQV3E1VnsmjGR8f0w9SC
         OurCbg9pO8mR0x/SMErl1rg+i/fTWhLY/RjQV7VJSR5qtNoJxy9HoroHdD24GGxml+3d
         nN1w==
X-Forwarded-Encrypted: i=1; AJvYcCUCJbG3yvfs6ztwkFFfaRMPmx30oVqIaeeQnHW/o9N0RPvEplmwaYDIqe+wZWD0R5Y/D53+5S+BvI/acAYietM=@vger.kernel.org, AJvYcCWOSm3Vuj+9iPhFEwz2c1KP6JFbBaoSyfzlVzVIKNmOO/CTXTEoDyy+oBH6G0wL1IT2/stb2Q6WNPVZNYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJkw71ErBV3VYpbxsDOVsR/Rh5lZBLc9nXc6qWC/P3dMGeov1
	0pKLQSdKni1BNOYJldBcToaiKkL3nwR0oRX9YDySDT+kKCCXklP4S40c9g==
X-Gm-Gg: ASbGncvK7vlBzHsMVyeOAZEPAbm+Hb9iYLHQPihtSqiMyq+Advkig7E73vrdCUwI41h
	EyP0mjbz/ebDIu7fP5Tocey1ezb2iatrEBN7H28diFFksv0tf95Q3arXy8YJnH3v6VmIMzQ3o20
	NppvnC2M0+cEDR2vMwrsXHxeU5os1l5suse2OUytNEGoyKNGKzKEmRbyfsKkLqRY6TP/H1CJFuK
	5CnOx3AxyF71cTnf8hkN146Q+bjqf5NfXAjhVTudUwNS6B1p9IolNX6OP1Ppvoi06Ku14gvBPLQ
	Ksf7cut0A587zI8g4tDAq/PoA7kmUGqjqXyuTEfNtg/7OWbCmvJjUZSZiw==
X-Google-Smtp-Source: AGHT+IGw6eYJ7veWCt36hL7+GBC9zVtynhPDrspz/RhQVbez7BW33rd8wz3/PrUMvJldd5RU34gp6g==
X-Received: by 2002:a17:902:f606:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-223f9a457a2mr42108565ad.29.1741196828131;
        Wed, 05 Mar 2025 09:47:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235053181esm116366555ad.237.2025.03.05.09.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:47:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Mar 2025 09:47:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Message-ID: <984b1101-5cf6-4b21-8bb9-db4491d97832@roeck-us.net>
References: <20250304140114.1812452-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304140114.1812452-1-andriy.shevchenko@linux.intel.com>

On Tue, Mar 04, 2025 at 03:45:35PM +0200, Andy Shevchenko wrote:
> Tidy up ACPI ID table:
> - drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h
> - remove explicit driver_data initializer
> - drop comma in the terminator entry
> 
> With that done, extend compile test coverage.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

