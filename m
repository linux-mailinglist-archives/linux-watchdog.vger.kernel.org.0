Return-Path: <linux-watchdog+bounces-4575-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F0C59C02
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 20:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B94313B210B
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 19:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B16D313279;
	Thu, 13 Nov 2025 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJJYYdCT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F72FFF98
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 19:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062305; cv=none; b=piLU2sBbVGpPzcdIf6oTndAZ+GplIzZ7DCh7Qz+JUwNZugbynVPYCZNYZFGrhSsChkwrOoXmcjxEzYfqKSGApnUoxJoUIjynGe92YzvK4FsSP8DksGImxe3aETtJnH+YxR7Nq1Rm1wfFPCs4cDaMiicAPPq+5Sbcojh76K4Sewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062305; c=relaxed/simple;
	bh=hjONu7s8QYU7+5r+4+8392Rb/ODrCfjvMIjJFGLzOCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsttqKd9i68YOgwG2NMWdRohVPm9BfwjN8eH6gqwqTYgawt05TAGxJITtIn7mbjFMfw46yzZpFJbyFK8rl0WeSwSpINdh/JsjOmKzNfBB4OrGyXytrMSv89YnFw/II5xBsUG4R6AQqI/hL+est8kxC2tVLdHBh91HOzIIprmN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJJYYdCT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aad4823079so1187507b3a.0
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Nov 2025 11:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763062303; x=1763667103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BK63ptxrNw7hKJ7SsWCptYH60Qc4eWwWIsrTT31syRM=;
        b=ZJJYYdCTZiRJMbOAB9TlopbbNbesQeWYwutDzrCiksJzVlvHB1koxOBgexDi2NGkEJ
         OKRmoCne9ExEBgayqQ2E8YkFakzEAauj/eTb+yPjoIBeozYVADd72VfGjYFR6uJtGaga
         CeiLVea354zmarrZtblps7+knx8VtWATbHE2tF7bLGcGCO4k59UjycRPZO684sfUEL0I
         4LcFUl1fdlatwU2jQnlePZqChPEM5B04OmiNG9ZAq6k1fVFJQ6NNIbJ24446Yy0E9FUO
         M84vaUsLQhWDvpe+33ZGQkra5k5QZ1W58RFzFY7PLGINBFXK7NgDfmtrz+XmpvkX5sok
         9wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062303; x=1763667103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BK63ptxrNw7hKJ7SsWCptYH60Qc4eWwWIsrTT31syRM=;
        b=Wyab2IjMcXKdpZzm4iRtd6OdnGzb8iz8dXOibtq5Mg5vSDUgN4a+11NbfGv/+C/dOR
         YzGXFZ0cvIoaAvTVbJH/qSAnupwOzlgN/VMCZuHDZWq38ChbyzE0ZTk8D5WLyNz6b+JY
         oMbY9n5dWajYkSIv4zC/2t46eWpiVVOO7sHChNsmfP5MY74J+kNwBnWzvauNUJKvbgd2
         vipSG+tL4vygzEUMjVx21/l+gz/ODutOpP3p8RH3rI4XghJzIcmH3+z6vYqmr/W5PE0/
         /2KBNcesr30+659fUY7kpne2oT/iscOYRmulllHRErViKauhd7kwAp0Ewzw5WwO2TyzJ
         /+9g==
X-Forwarded-Encrypted: i=1; AJvYcCXriKzcV7XG5lTcrfE1KSIlTF8yNijNNqUscTzREpFQRd/SZQoVTtm2zpcGPt6uGcTSPfpL0Xr0tblKZZP8Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFZXNoPOlWzdM6sGVjrk79a/PLVBY0/7E3FQ/4qsRq5Z+LEZ9
	BKkScIWnr9drbaqx2st9XQeGkjjrQ4uKApymsDRl3bRXN/V7GEhhYIoI
X-Gm-Gg: ASbGncs78CREvpbU4iQFseMElTIgD5aTQD4TusH7Yesh3iwgq2ccjb1Ufc3igBxVPzC
	9Bq2vxeyWTn9qB6v3pUyPL5jFXmuPcLGZiOwbWGxmBC6gHYqNad940MM+gtg0s2hj+gMxSGSeU7
	a1f9luBLyGDZH9N40bW9XX86vdV8F2zI0Aex074IxtuCQ85aKFdmUj93pkQJ0gDRmwwyGuXi8v/
	ktIPIJ5swLaEYpze9msZeF7x4rHRw8gaJT1NI/+vRex2B95KhS3GKs+e0U9Q7t5Kx8MpYZerfsu
	i4IMwyJW8wLM/htIhrdNBJw1mqnoeUoIYy1ov1EAS11pjmbRLwLnMxeCnT75kFTD/6sWjlZjYZg
	Bcao4nfuT4nl5a8BwCx5/inQWH2ycubQDSs1VniN7IjMgaCsN2lg86rxsNRSzkg946S01VRQ2C1
	+ICpWRGe/7/qlP
X-Google-Smtp-Source: AGHT+IF8Qs3oK8rVfUqYvXgnjaYZ4iR3B3XnGJ1AUqt96hYmbod0XJb8usQsl7Escp+TSr657zoeDg==
X-Received: by 2002:a05:7022:3b85:b0:119:e56b:91d9 with SMTP id a92af1059eb24-11b40f98615mr210070c88.10.1763062302783;
        Thu, 13 Nov 2025 11:31:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm900826c88.0.2025.11.13.11.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 11:31:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 11:31:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: wdat_wdt: Fix ACPI table leak in probe
 function
Message-ID: <89e111c7-868f-4476-8a7d-98936674dee2@roeck-us.net>
References: <20251113023032.547-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113023032.547-1-vulab@iscas.ac.cn>

On Thu, Nov 13, 2025 at 10:30:32AM +0800, Haotian Zhang wrote:
> wdat_wdt_probe() calls acpi_get_table() to obtain the WDAT ACPI table but
> never calls acpi_put_table() on any paths. This causes a permanent ACPI
> table memory leak.
> 
> Add a single cleanup path which calls acpi_put_table() to ensure
> the ACPI table is always released.
> 
> Fixes: 058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


