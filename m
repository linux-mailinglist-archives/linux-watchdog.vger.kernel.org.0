Return-Path: <linux-watchdog+bounces-3815-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A48AF8402
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jul 2025 01:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F19251C85169
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Jul 2025 23:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD8926562D;
	Thu,  3 Jul 2025 23:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlNxAuvS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993E29C346;
	Thu,  3 Jul 2025 23:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584524; cv=none; b=uKKDjnXZqzMcytRtrgAUnYhKXdIdXzWRVl470uYPMjHHLNsi65lO9AyctcqAQ77wgWbmtCVRQP820O6alzxfkFnxzrmcfLUI4TpP7uJR8k9KsSK515VKT6vYQW4VRKTo4497gFy9yBzoKtTP5kVOi78FjPFzuEBrTODNuvTDGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584524; c=relaxed/simple;
	bh=wnyYfnWDNZNK2o0hthGeMvpdox3sXWz9jn/UNzI184M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mT7grGtvydoG2V1vMCQt7u0DABNqroj0fiHXJsEZhWhaCw9PcU1OsYCzVwjj22PUPt9Gq7524Ktok/bV8j1zyFij81g93+jimpsHwWE5rz9UdtKltIBZWCQ0DCsYxLeixYHyfQctW7hz6/WrK10OZ9fbertFcuXmk+Z8QZnkNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlNxAuvS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748f5a4a423so325573b3a.1;
        Thu, 03 Jul 2025 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751584522; x=1752189322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GizTXbCy7LK+4fBlgNO+t1S5zY9ftX491aJUvuVlErs=;
        b=FlNxAuvSRpQyrHXL9dZEZ480LzhTBJ8yFTkfYWWjGt5vtFv/s+tHPHxqJpw78P0uT+
         1V2dcKG9JQP09lw3NuwoYtDKXjbrpUN2oi+QbPgRTdHDln5mJy2QnvxqdOHb3ushIIv8
         Pc/IsMIe38Lv6g8RcvkH9b46neuJrEOdjLUxxphoNBz1YgYhZh6oJC026fNB3aQBY/1f
         fPBPXmSupxfXGEiUCVB7Ov3gz8RqnzDDnnlbcx4sDEvlLoYpDDscVae7zMkZdNcldpkj
         m7mwvGZd0cbQeaeB+DQ8SDv9NqfSrBsAwSfpUS/VWSlFHBIXclSL2wxaM0Q5GhgylLrO
         Wmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584522; x=1752189322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GizTXbCy7LK+4fBlgNO+t1S5zY9ftX491aJUvuVlErs=;
        b=RL7onpRGsCaJRlRBYVhhxKPn5zUawPE1MF9GKymwu8tok02+9dxzRpanFL1HN9/CYH
         ZoRGD8lRHzpiuBmqj35S5pOmwI+SQLMIM8rN5rKoY1LA8wVps1XviTQGR9QfZQcBy1+R
         kZM1vvxFQexjKPUt0oII8V9bp4TAS/JEqJYPKPxCGYzONizfWxOzwrsG39sG94DQEcOd
         FkOr9qvVYv8iSMuFO6DFCTW+COxThiTTkmg/f9iECapSUIA0y+97fa1jl1QLthPsOss1
         RuTBnQwYi17R9oPfL9P+7i8mpN1iZkNdKBOo1Xq7yoQChSV46sp8wt1JYEepqijFI09d
         GdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMZfx0sXQ58KN84FBWwLgo+E+EuO/Q/qC2Rr1wFTNZBqHW6V9/lyspOW1MHBbJlKvSnPCKqJVmlFLkmA9DkjQ=@vger.kernel.org, AJvYcCUfDpfLAdypLV5lD61qSA9Z4oUh5e6uveuvGZT4N6Ow2q481RDJoDOAzNqW2xEblsJyL5itTM+R68DsssM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIaXNMSkgLc1101tAiMMeJCu8V3AtrcNV0DkO3jpMnFAJYioI1
	wKTTuoFEkjgryDPLFZVsR4ioEWCkDpsUlGsY0eddSUisZdZpr3DjE+GeM23ynQ==
X-Gm-Gg: ASbGncu9r2lHnbiKLjYOusoonVn9t7SjOwLjsDu2Xak4orLGs2epLvyO6+/TPy/hnBz
	3PcfHy2Pj1n9oEeytDjGLvRDOfTmSZ2S7iI0hzV3zQiJe5oqGE0DVq8WukStK5Hn9aHD98FO43H
	hYZ3IyIrZBpLVnC0DbzW2OLJq9giOkh2euv3KJn2zcPl3iDI/Mn5v1U6HOh4bRV09zXQXz5jZq8
	U3gg8z5MIErlA4DHC4btw5KFNz48V7ntegUzVHjtJ9J1v1iZwFl/e64Jfcrmes79YtBxh4TkKyu
	hMr5TqOU1Cj8GN3O6lGW0OoblOoySaPztB8y6mMTsv36c5E/17mBwb5ZFZwAnN3tB4/OybD5lkY
	=
X-Google-Smtp-Source: AGHT+IGDAdROEqFb5psdJny2/07boINbztZyH58nqtZF26elIpX8OqELw0hT12YQhV9vGGaXohaI5g==
X-Received: by 2002:a05:6a00:4b52:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-74ce630c4ddmr639402b3a.5.1751584521917;
        Thu, 03 Jul 2025 16:15:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359eeddsm576372b3a.7.2025.07.03.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:15:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Jul 2025 16:15:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: rti_wdt: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Message-ID: <5ca32e96-e6ea-4525-aa90-87a83ac6354f@roeck-us.net>
References: <20250703183518.2075108-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183518.2075108-1-robh@kernel.org>

On Thu, Jul 03, 2025 at 01:35:18PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

