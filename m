Return-Path: <linux-watchdog+bounces-563-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4B845FB7
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 19:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6DE81F24013
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 18:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2950612FB1B;
	Thu,  1 Feb 2024 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8z9fzex"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657C12FB26;
	Thu,  1 Feb 2024 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706811636; cv=none; b=Xa0j6edDqlanD20rQmtGGNwKbbJcZ+cmD+jgLeVv8+nJI7y0+lLJ1DO9mxRKLU4q9m7o+23hLTcxc5BuoFTk3hJoimCMvS7RjdtL8Gmz9qzGuXHExOfEPtddvHMldxX8Es+/kPy+nVtYnYUiqGmp5Spq4V+YIpWFmb0GV+RMUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706811636; c=relaxed/simple;
	bh=MFPFOZLyboBCaHhs4wjedSEJqvbkEz6ROtspNErx09g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nV9YWVHJu3ANeIPS2TQlPzbILsgiaEVM4ixo59ISIroR5aayEVqMOXqxSEP1cKGKSyr6+1eAT3oXOTcRFohCx9PpXemx8xQkUDysuqI9RErInUQwslUmX2udSjejSoC6l5Psx4O73FnfpW/g2eVb5dlJ+ymX2dSyr/SHQ92K+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8z9fzex; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ddd19552e6so707534b3a.1;
        Thu, 01 Feb 2024 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706811634; x=1707416434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSqc813oeby3hFaC6+s6cu+puxYhYxgWliWm1NeLVzk=;
        b=M8z9fzexzu+zgM70j2mXHIs8kCd/gTOIcacJHDkKIufFWTg48rwbqyP0RIYXbnvAVR
         Q9MAjue0GsoMJifNfoJOX/5YYOBduSKJvuPBz3B9aiTts2sPl3ZXcBmPfgfT0QduelSf
         9vXvKSXtJj7S+LHbWctoFyb1Uj/QYzYRDtyNdJIhR3WBa2YeRcRD2X1eDy2Qf7UOBXyF
         uiTqSZ4xmBMHM7zBreYyfQqANo5c2vdcSO/9JVUKUh07NdHUDuLbVJly17XCR37szkn/
         Y2CDpT2xM6hE9KeqBfIUcJDm9aEpxJBO8+7J74QM1KkRvHCWPPKxwhRR8YpeF0xGviZ0
         lTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706811634; x=1707416434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSqc813oeby3hFaC6+s6cu+puxYhYxgWliWm1NeLVzk=;
        b=AOLJuNoQQhH8hNmlxelIe+cmV845C25hpYZMoDmvFIXUeUwug/7brh5mQ3iUp5BSDo
         7xZ08R7aF0+6UUwK71CChjtnLsQneJD81aycgfqgbSN030N2dJnhbfsRVuyr/hxOK0Ga
         qpxsDa2p/oBYSFG8JVeR+Z6l2z6BU68zq+QrYSaoehXy6w2zIIrmQMFJI6dCQLm1XkAE
         4h3NjfI/fkjAzeljuDCuRxq/fQnc1VsUNGfBiGby50yFGJNSr5KbIgbliqD7wRRxj2vn
         o80tIOHDm+L0RSHewxUlPP71KUzQPD03cRDiBVcn3x/EmQLU+blNcBMwYPP8bd0lVGP0
         U11g==
X-Gm-Message-State: AOJu0YztDWpQfjlXxBMhWu9pPBX9vb0zd5jEf33JBGMV21pDi1JhN4wx
	IItPLIW1iwS01Kc5dzzYSalVH9lypbnRBOuAOh8zl+JgdNg6SX5BMuO7lDmM
X-Google-Smtp-Source: AGHT+IHCeZYS3lbaSh91yRdS5d22A3TgzwDtDGOq51XBR88IKV3YwVqUdl06eRl5QQGCrLcZEr6Gjg==
X-Received: by 2002:a62:ae13:0:b0:6db:d040:4d05 with SMTP id q19-20020a62ae13000000b006dbd0404d05mr5088801pff.22.1706811633704;
        Thu, 01 Feb 2024 10:20:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUqURbAGrAJnB7VfhYcEDX5PIcJlGlZ7xzUeb83Syb/1XyO4EAur3Q1zufBvI6N7YTFjrWrKq0ZZ1qGZzd1SoONn0reicwLzwo0wvf0ArM5/RIp4AhFyLtQ/cqvJbPiORyJi0BOJKyqDbbOX948LTp/A7FvGxrbRfl+U36n9jW5YAkfQorrd+tavYp92L+KW4n7PHmRDmp+Edanc5PXID9+3L8MZ7S5cb8oz8P3WeU2B99cN/vRcR26HPUdS0kVKwc2cNUhfQthRFhrkw5sDyMCv9mk1VBXXDcWNxJxzyVs9K7KHpbBYdBMdMKYtxrKuEGqWkSEYE8A92q51BsWhVDlfBnJed37+P/rBcADdB6+U02eMg==
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7845a000000b006ddc71607a7sm36789pfn.191.2024.02.01.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 10:20:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 Feb 2024 10:20:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Minh Le <minh.le.aj@renesas.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add support for
 R-Car V4M
Message-ID: <1347cb35-5336-469d-affc-25018425c13b@roeck-us.net>
References: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>

On Thu, Feb 01, 2024 at 01:19:59PM +0100, Geert Uytterhoeven wrote:
> From: Minh Le <minh.le.aj@renesas.com>
> 
> Add documentation for r8a779h0 compatible string to
> Renesas watchdog device tree bindings documentation.
> 
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 951a7d54135a6849..ffb17add491af98b 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -71,6 +71,7 @@ properties:
>                - renesas,r8a779a0-wdt     # R-Car V3U
>                - renesas,r8a779f0-wdt     # R-Car S4-8
>                - renesas,r8a779g0-wdt     # R-Car V4H
> +              - renesas,r8a779h0-wdt     # R-Car V4M
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
>  
>    reg:
> -- 
> 2.34.1
> 

