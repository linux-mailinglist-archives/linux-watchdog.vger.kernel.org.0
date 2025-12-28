Return-Path: <linux-watchdog+bounces-4739-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873ADCE5653
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Dec 2025 20:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40C23038062
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Dec 2025 19:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E031B25C821;
	Sun, 28 Dec 2025 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkv0zfwa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05C21D3F0
	for <linux-watchdog@vger.kernel.org>; Sun, 28 Dec 2025 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766949305; cv=none; b=SygoqGs59iqCVvAXzqyou2rCZ9zy3a+TJCsnGR4YaMRhXT1ssxXa7xTTDNq1qMBZL6m0E4Izo4U4xaCvsGzxBc63MF6lR7EdlUP/kNsYRu67gzZl1behMro5qPRHdPfRw/JJpp+67Iyf2m9hywPZ8oYHNf0Xi434vTAz7+iSRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766949305; c=relaxed/simple;
	bh=uBIi0hmaDwZ1Eh1xO1xknbZ/SbqWc2xbKea2FOtMemU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVtMqekBJyMyd3AnfNomN+dZM7HeSz4dCXZmPqe358Nvpcpy8Ae84xhPFqSGN+hbt2Vp84vSgHT0cficy7fKbj+LKXFRHpPj+GW1fSw7LItQlbloNMVaY5Z8sKWQzd6i2rdH8N4PoapxpD1ctNbCI7cALvRqJszLDYq6OG0s/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wkv0zfwa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a09757004cso109329365ad.3
        for <linux-watchdog@vger.kernel.org>; Sun, 28 Dec 2025 11:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766949303; x=1767554103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHbPrPVl0kUpoIjJEVG9hcK9D5Qj6LFWzjIyV2/9lYE=;
        b=Wkv0zfwahg6iE8yaOoPZppXIoVCtn/OmHGcb8TYFNyi9FTe3HHV6zc1QpfpWBnc2uy
         OpmoQfQD/q3zzOpttAXEhZsRyE7mUaOhAGzs5F5GIRu4/J17mOu5MmDmo7trm3nGmsjt
         tx+UiezpGmDDUCTJ3lPCPMeS9Au8QO4FzYKYTM4inRC+ncQVNwLREE4Y0FiEaW5tEXHt
         MH49SSw5u/jigB1NWSdhr7d+WthpCyzKlU0WPKGmNz1qZVuDhYpFUZ5vT2m7wYLt7EbY
         IHZf1Ku2MHjCSN1l1LVoHtYpb60izAXWh7kSTro629Kw38yFa5FB7uAeJO58dZPo3b60
         2RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766949303; x=1767554103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHbPrPVl0kUpoIjJEVG9hcK9D5Qj6LFWzjIyV2/9lYE=;
        b=Z7P35NcnrLAQHCDP6taHxuU2dvQSGulyP4qadtE9b8VvzfSYM82A1eJOxpuf2uSxxB
         SHJBLvrWFkZ1l/vr5zQ7C8MEcRldwnW/r6H1o16vbHZZYCnx0DHX4iHGv8H9q0qyVEGK
         NdIqCUenOSwC3qr0piRd0hhfpkTUAYkqHjl4Cg++VOrfBAtQFwCXsFJtXuUHx8+ITQEH
         OW+kicbP13N+0fWEheB6vlx7jx37TnNwdb3npaUr+pIszVvUCIbbUmtOqFiFgLlh/5TP
         7KuxUd++xo/OaQDxZYu8Wi/XHqAn5A50S6Ob6t3eFZGHbOw/nyAOtRIBYACeafrc1yN+
         HN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbBanocRQstBkJhAY315w6FLGlTl3+JX/AnutoftwOA1cwXY6lTIn0yXHI4fk/NW+lGK2RcLPmq71u/TLe4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BIrZ5UCcHOs9tdMs1FnrgWyiwTQvLYsbMU+tXX5L6qLRZeJR
	W37KC9l+qbapuObNr1NIr0VB98b2irPYA/R3UxMJPpCLZv/65kkKriog
X-Gm-Gg: AY/fxX4pQjKu3aYWcOqQ5Z0UbjO6jmmNdGRK10B6QOhb7AMAE155uafQjnKAoOi4HyB
	kswQ0xlzHw1yD3xNTbKftwaH0fWdA/gVThGff+tC9HXc7h0Nv48XJuBolgqbm13FBkhRgBbov0z
	b8oOQqGImhqK2nczL5PFT/VsXKH3TLwNtAIB/PCEnmnaZ/gW3lMwlxIrwxfSd8HsyBxjr/fmPFn
	Hjal7jlUfPnPb7OiqhlpQ4ATUlTX7LzRQZ/pMfZ/N3SoYjm5iL1NR3VbvFD5BJyKY6wmfsLMjBo
	Z7alocaupaqoiLdACcLVgHIeeRrTIVZwYEIXqbeTbPN8F71mv/r5k55JwDM8YD9bbJMgarTKdRI
	nMQoivsZEgn0Pl/HJJI1Ma+zjcpKVJtSyCTNxaYEej8pE9HtWzr6ZgJIztDzi237a6r8KKUOLEW
	Np5UVUib6o7z8XCEqU5akcQw21/78CLw+H5uo=
X-Google-Smtp-Source: AGHT+IFpQrSbu8E2FonDBThs/wNXWFzgSUzisxOMkr5qF2hrmWL68A7m9Gi2EfPmMwfr9qHJvfAiuQ==
X-Received: by 2002:a05:7022:ea24:b0:11f:2c69:31 with SMTP id a92af1059eb24-1217230ed72mr27203908c88.46.1766949303308;
        Sun, 28 Dec 2025 11:15:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm105992702c88.1.2025.12.28.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 11:15:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Dec 2025 11:15:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Brian Norris <briannorris@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v1 09/23] watchdog: rzv2h_wdt: Discard pm_runtime_put()
 return value
Message-ID: <6b496da6-c6b7-431d-ae6c-34f5f682f944@roeck-us.net>
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
 <1867890.VLH7GnMWUR@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1867890.VLH7GnMWUR@rafael.j.wysocki>

On Mon, Dec 22, 2025 at 09:09:22PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Failing device probe due to pm_runtime_put() returning an error is not
> particularly useful.
> 
> Returning an error code from pm_runtime_put() merely means that it has
> not queued up a work item to check whether or not the device can be
> suspended and there are many perfectly valid situations in which that
> can happen, like after writing "on" to the devices' runtime PM "control"
> attribute in sysfs for one example.  It also happens when the kernel is
> configured with CONFIG_PM unset.
> 
> Accordingly, update rzt2h_wdt_wdtdcr_init() to simply discard the return
> value of pm_runtime_put() and return success to the caller after
> invoking that function.
> 
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

