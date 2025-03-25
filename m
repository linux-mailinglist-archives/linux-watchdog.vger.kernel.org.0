Return-Path: <linux-watchdog+bounces-3134-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC4A701E7
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 14:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055F21889C8D
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52346D529;
	Tue, 25 Mar 2025 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI21iEEj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB389A95E;
	Tue, 25 Mar 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907691; cv=none; b=j9lOR+uiTqRZA5UuTZaPD6Z3TxXWwvEKQ55ltMbW7wsQqjG881UN/UtTliuNF0ykSI78btTIbT/NWzkblFF5r3m9xnCaAP9OaExaEJrxN4bbQJmxKBiQqVPLxnhujoKvEg/6E2bTdnkss9NEwJRdl6t+s3soP6sJZdkUajJhuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907691; c=relaxed/simple;
	bh=VlmKmaCv8XsvZoktWGY/osYjQkryJhlVJQZ5ezcxe/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIyfpzgdl+TFIdQ2p5yVFJMaEhY4IbEsy54zOiD2uc6daK8QI8jYWGl98xJL9nxgxgpsYvKC0ZV7zzIfFRUPqPstj4LOJ1coK4MeHx8hNSx6APgFgjPRt5qWna5YB36q0fXBDgCbR5Pw9q0kT4/UlgDK53MRp26Xp2HXxuzoYzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI21iEEj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22438c356c8so110705585ad.1;
        Tue, 25 Mar 2025 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907689; x=1743512489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBuBnxkw/XZDN7xv0Mhu8QEjJfXhS4g0UdGa682h5/I=;
        b=OI21iEEjW8K/mUhzERGZ9AgVCkQqcw9E9KD4lTWyuxZs+FjKg2NMYXVstnLd3//S/3
         aB4b1+Gk9BCkXDR/GEQTa7xYg+i8aEQ0NmIhhq6CWhdkNujqJVkaLy6EdlQEnVqhpfHX
         X98BoogY2Tpd9d8SQEmGgB84dkw3fnoiT1Llbj5PDJVcFa2s/kjVSh6CkYM6K9FWy+b7
         7qeDjDarpLb9p9UWT4OJFdP2n6Heugd5N2eiqiXjc5FzzSvzeYWMpBCVJD15RYyinnsX
         OvpuNjzfqYNZVbpiz016PYoMc1vzm2lhTp/L9jOOksO9kF26pXL1B0x5Z544bJraW9nt
         v8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907689; x=1743512489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBuBnxkw/XZDN7xv0Mhu8QEjJfXhS4g0UdGa682h5/I=;
        b=gUyLeRpOSp5exM9RN27BRX3+UD9KfRN0v3S85Q0SUM2O6NmjE6YaPVH+XIGszUlFE5
         4nIyrm5L/1RcXmYcozJdFcZCiwY4GAdDOOj3obJqasK1O28Pqoh03JHVUK9v36fOd7xR
         dO/Noww2ow0vhZSJZN/tNrfDYw6NVuQPxWtWEWuseZrNx2myu+esh6f/Rey8kjbso98Z
         QoLSzVJY4Vxc2oOKTUiUke/NILNMnXWPnu/QPMWf8QcNLHVYk3YMX9rI4S4rz/TeRqjP
         6xQuuk9/p2FceNXULOlJQP7EVqIrA7g1dnzuQ9eK11W48E5yj88hGvlbJOAPaCNlliev
         EcPg==
X-Forwarded-Encrypted: i=1; AJvYcCUnL5wJiCMLHt3kDKUpShNX3KG0yFGz83EaQL14+JaEABkcb6U5z5PTleuyytG87gfHh+A2r6MjPmTffm4=@vger.kernel.org, AJvYcCVXstO2X5hud5VlDBhbYVC+UGvo4npW4vyYfz+Zo6TMuTqWY6dxasvSqmsaVHM+/HBLMxZL99RlCrq0y89j1lY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXaNKB9kc89C/xhPoFMUBsWop6GFhbyZgN27YQbORWM9rkyYh
	eJXfzVwqv1zu45m8Gv+R2pZFk6M1fs3jQeD1sIhfdGj7XOsrH617WrmMxQ==
X-Gm-Gg: ASbGncugpZCKwu2v6iBOqc5Zzi30OyLN7HkUF5+4SkPljhui1nX216xYVKM92DCKa+a
	VynlMKWexepGg9uG0n1AYq1nlKr2Jq7O1uSYKvtn5dL5qlJ7AAQRMIf/n1jOL4fi/O9A3GfbM/d
	JPn1dk858reSVl8MBLGxC6Pbn8yyZjRF5u4gZO9SA5B/7+oJxhnsm24jifWaN+5eEYvAag64E2W
	wdlG5eOTKNKAGSF1VFMqHZGd84PDqeYHedd/dZCPEVMeMZBykisy009Zy2UvMO78AqmAxKW+Zli
	bEw6/ASHJdICjqc6BCLbx8A6Ntz3Pp3D7zdQgE+4f0tJXAR+JlxBqVY2Ig==
X-Google-Smtp-Source: AGHT+IGxERLkoDlMproSsV+C1U0jxL9WWP9C7QtE3EaqamGI4s2jfjVgQ+shIl2emFpsnOPoL3pNww==
X-Received: by 2002:a17:903:188:b0:220:e338:8d2 with SMTP id d9443c01a7336-22780d83b25mr296411615ad.21.1742907688718;
        Tue, 25 Mar 2025 06:01:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811dd182sm89044455ad.196.2025.03.25.06.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:01:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 25 Mar 2025 06:01:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] watchdog: da9052_wdt: add support for nowayout
Message-ID: <84b2f1fd-6d8c-4e7b-8024-8147e6067a98@roeck-us.net>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
 <20250325-da9052-fixes-v2-1-bfac3f07b4a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-da9052-fixes-v2-1-bfac3f07b4a4@gmail.com>

On Tue, Mar 25, 2025 at 08:27:12AM +0100, Marcus Folkesson wrote:
> Add nowayout module parameter for not stopping the
> watchdog when userspae application quits.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

