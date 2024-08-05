Return-Path: <linux-watchdog+bounces-1447-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF89475B9
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 09:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86D441F2138E
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2024 07:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1A8145B05;
	Mon,  5 Aug 2024 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PujBspFE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D86A01E;
	Mon,  5 Aug 2024 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841618; cv=none; b=hdhfV/hVJ2b5SuhuiHbiWHous+qBmAZDq4z15VVSomzEvM9zvkN9FgNjZ0amro/U5IfdFzRn0jZTGFWFdbQWzA3uR4RObqJycSAUQ+alLs3WZ+C/mQlxBYY4SDH8CheKElRH6yt3Uy8rxoJBHc7hpXb65ZvLyxda/4i7hNcycLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841618; c=relaxed/simple;
	bh=4XqyUiKaQFFwLeX5Fyg1wWnbwOi3BPFIuuUL9L060MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKrcOc3VWIaOrQq+XvdhbAkSQ/8RN8U2x+ozuFb8AllGw9rfWtJEpea8aSN1ros/J9qkAW51NPEzm17x5b1v5+PxvXlMJLTSgp1PDiQVATN5HisCJpXQSfkxb6QYRP+wmemsP29ZaXM0xmEI1I9bpRjDs8SaJ82hTgGpnc+Yl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PujBspFE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so2227323b3a.2;
        Mon, 05 Aug 2024 00:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722841616; x=1723446416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipj8h43pPOKTNzU/Znuuk+lVg9B/KjDAWhRCKAX4HAc=;
        b=PujBspFEGQUtIQNLQzYBHowgKTnA+lbHvyNrjqQRxR9cCSjwO5gCTCS/80pj0EIB8A
         NGa4NjGhl6Nb157V4ftvxbXgsUBNcW4mldeG7CP+xWebelMtlXA3Q/snZ7j0KhNBuQ7z
         FqPIglYo/38/B8BZOVWBmdmbVuMvfl5Pot6ZXN6Puh/u0UWbR6JlPkrVvIOjomdFOKMR
         Psb/qZEKYoMKw5K0DBohreN/aKlsX2+aGP7Gi9jNxKmv2CYdWZSfr3SLgf463rbhmVw1
         vqiMQcB/5M7zBaLDXYOxL/KKmvIWVTDwRwyEAfiPgJEkSQhuymfRFoYgpZMQpSB2z0bZ
         yoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841616; x=1723446416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipj8h43pPOKTNzU/Znuuk+lVg9B/KjDAWhRCKAX4HAc=;
        b=Z6J2l4hMSQQ0AYQDrp1SdbmtinXU1BJXu+EE6nLb3/yuTOX9yshV7VyBp4U0BdeHed
         W0wTV4hj7Q82+8R+XniVaHoguawlz66V0qDuh/Q5vcETzhwCZaUXIxNf4b4etouH12WF
         5Z735dLN0qixf7h2EKCEiZBZOs8Uj+rv5WRawettCYDhHomJeiG+TwO4NwASOEqgjcrY
         FEyOmgQHYDFIx/fShJqVZoo0j/abOrVKruEIXTnvHTjV5MEoQHHLQYOHI8tqPwHAMVYS
         jrydBGzEWczeRznoXh5PmhS0sQLXlj57AvAur7CGTEfbN7cu/IwPdBwy4a+AOX0ejb9x
         19NA==
X-Forwarded-Encrypted: i=1; AJvYcCU76h82oxsB+3Nm0QjJwZE6eGTPkm8bI03yRV4WPNyG12A3GrTD6d9s4si9TCNGbs8YtguYjiu1GgN8tZzf0qrj3E9zIfC3Wml1K9kw22pgSPdnrE0GabwONf6u+anO6tNir/edMpnmpeyR3U4=
X-Gm-Message-State: AOJu0YwqX2w6hz8Oi8LHFY01y6FIuhXfFDmK8R+XjV8dE2nK9LCIWT6l
	xaYkCphD8dlBIdIJ/bHmBT6RB1a97DJ+kpij119FU3wCowkRwb9U
X-Google-Smtp-Source: AGHT+IFxAYYNsZNMQw/gsUmLCjSi4vHnVNtAUxZy7n8oJT1OGLmzuiWv/1dPuXXixJuOopBlnTc23A==
X-Received: by 2002:a05:6a20:db0a:b0:1c2:8949:5ba1 with SMTP id adf61e73a8af0-1c69966b82bmr8176033637.53.1722841616404;
        Mon, 05 Aug 2024 00:06:56 -0700 (PDT)
Received: from five231003 ([2405:201:c006:3108:6fc5:f50c:613c:4ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f2734dsm60525145ad.41.2024.08.05.00.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 00:06:55 -0700 (PDT)
Date: Mon, 5 Aug 2024 12:36:49 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ti: davinci, keystone: txt to yaml
Message-ID: <ZrB6Cbe6JBxFPRWn@five231003>
References: <20240727050736.4756-1-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240727050736.4756-1-five231003@gmail.com>

On Sat, Jul 27, 2024 at 10:34:42AM +0530, Kousik Sanagavarapu wrote:
> Convert txt bindings of DaVinci Timer and DaVinci/Keystone WDT
> Controller to dtschema.
> 
> v3: https://lore.kernel.org/linux-devicetree/20240726150537.6873-1-five231003@gmail.com/
> 
> Changes since v3:
> - No changes in 1/2.
> - Explain why "power-domians" is needed in the commit msg and also add
>   the Reviewed-by tag.

Ping incase this got lost in traffic

