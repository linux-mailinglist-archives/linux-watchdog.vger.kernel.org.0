Return-Path: <linux-watchdog+bounces-3135-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B0A7019A
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 14:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0741843EEF
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 13:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48730256C88;
	Tue, 25 Mar 2025 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm0uiIhK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4FD53C;
	Tue, 25 Mar 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907715; cv=none; b=UFHcZEvB3ifgubfLOoXQ8TgvNdeScNJ/+L1z2KAnxZMPGkyBSX9dGsp3O8vm1Kw8Fg2lIzCXY7ztq9Zut/d+vKlSMDl5Tk1Di9YtXM7oTqGgkKq95WuC3of/wqDgdB/8el3LZTi2yMuNRqlTp6AvQVtZhAIVKD5URT1/pDbFhRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907715; c=relaxed/simple;
	bh=ChDDyeXHBmIp5lYuhOG5pqs0dqH9HwS+H4o0o1uxWXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAHwg7wqKPxSHWXVVdGZtea6neAvgTrJ5ZmYtsqhcrzACMwnkU30EbM6SigImLu2CaxYhYJLJDaoftwQzHLTEJNm0L1mqxm5h7RTJQfLOu3X+QXSRbEzP+o+f4lN1DJRPVE7QxKv3to9CMuPP4Em9lV1l4m+7VQtl+Gtd/zrLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm0uiIhK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-226185948ffso105670365ad.0;
        Tue, 25 Mar 2025 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907713; x=1743512513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eakavgIIxLImWp2a1A76dIncpFHpF9rY6XvVvtdLww=;
        b=cm0uiIhKt6+GGpGYX6Zy0YmThevVNZBhmGdbHKVkELFggE7MEheYJMdapIRxNGe9hV
         c5xwHPprX3JCditqFP6D/BfhOuDrvVfgkFTepGPKCvt5SR0T6ewNCdpxuRj/VXdKYMTo
         Hi61jY7a1FTgSV6zUWGpEbLddymapFLcszrZNYcQlSlsOaQZTTTLzmB+OXADs5LNgDvT
         bBEA+fBZqIIB91rH6fHs9Iq7fhFk36c8KMTP3Njd8hwqmcWxGQJhnSrIvjUa5+DmNDgH
         Y0p+c2EqvyFo6a+rgeJprG8NpeLGEOrSs7s+MA3Jv15FGxQKXstWhift7xqduBrylwjF
         6Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907713; x=1743512513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eakavgIIxLImWp2a1A76dIncpFHpF9rY6XvVvtdLww=;
        b=oEM6uN/i55i6LkXjdXLTFC/2ULMgvNdvHIy2jU7Pyys+PNQ6gxRd1N/6xa2Iw3JbdN
         Me+i7u9XUkYYhsBmedYKIYF1Zvf8GgRD3lYoiWMpDxxL3xBQNI9Q7/8/zk/q4Wg3915b
         HQONOzsd9EklbUy+LVrz7SzHwH9bZ8RlDjwnogtJGQVoDeY+dOQPZJ9j9PIfvum5SI1B
         DtpfjPT0x79zYnVBQKRcBXBBXsm7HdDzKSmQ5y3GS3KfV5Gqdhr6Y1tEBuC9rjkY1EHe
         uq2xTLhmBuyKRLdSOPtddY3v/1oYKOUkTTsKgFCSd8lRmJnP8z/RuwKX5o/plnAJLD5j
         8YJg==
X-Forwarded-Encrypted: i=1; AJvYcCU6hwYReeVafMWCfDDv9v+wszYTEqs4bus6pwx87gMplNf8KSj98LSiolk9SXtfBsuxnZBClTf8phpvpMKCRXM=@vger.kernel.org, AJvYcCXo808+IItXSBCTY2hBmnId7wmngjX4fXNxb0hJpc/gR5oYa0PoxNkaTHVa2Hs3v1jsfEPmkUkWzg6iSmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcSpv1D1C45ueqZtBwmbX1S6fyXLm+V42GSTZmHCNUpxzxNYe
	Hchq6zvVJk4troKnws/EHJyriKP7oGTEElScqk39csbNrjs8lcPa
X-Gm-Gg: ASbGncsEU0qB+Sqauy/kkoJt5uvIjE89oZG4zQtzf2CLPuxU2Bxg+kdLUp4/foc2saR
	nXgbU5/NC9nS7UiumuITfhJristaSsNqzy2n4pV2UL41nCK2Zvgkeap4oTG4R7e5vMl0Inb/C4Y
	TvMADDqij29ALfZ5G8IM2sZjsLEVcMFxrtFUEAHFFleOm0Bw+u6itm5FVJMMENnYuA4ASZg+AKk
	3uJIYo+rAYR78sGfKEYbUChlFqzwgsEcHdyurD9ZyowQ0Vxmnl66f3x36hDBAn4JZ+V/taZYWF4
	rkvf/e6Vp+xuRRNqQdKnKwg6J8e78MnnFXa2KdEFlU5VR17gzGJZl2GhLA==
X-Google-Smtp-Source: AGHT+IHvtynTWNxLoQ3IgRPWxLPUB1X72tcT/Mi4Ko1ZGWDhgTK4FXPGPpRHC+eyfHtUogAbbNam0A==
X-Received: by 2002:a17:903:46c3:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22780e0a7dbmr294796755ad.35.1742907712571;
        Tue, 25 Mar 2025 06:01:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd67b5sm10365925b3a.68.2025.03.25.06.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:01:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 25 Mar 2025 06:01:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] watchdog: da9052_wdt: use timeout value from
 external inputs
Message-ID: <5110bf6b-9225-4a90-ba98-a470aee139b5@roeck-us.net>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
 <20250325-da9052-fixes-v2-2-bfac3f07b4a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-da9052-fixes-v2-2-bfac3f07b4a4@gmail.com>

On Tue, Mar 25, 2025 at 08:27:13AM +0100, Marcus Folkesson wrote:
> Introduce the `timeout` module parameter and pass it to
> watchdog_init_timeout(). If the parameter is not set or contains an
> invalid value, fallback on the `timeout-secs` devicetree property value.
> 
> If none of the above is valid, go for the old default value.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

