Return-Path: <linux-watchdog+bounces-2086-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF89910F9
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 22:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A6DDB2192F
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Oct 2024 20:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDE1155C98;
	Fri,  4 Oct 2024 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmenuaum"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D500231CAC;
	Fri,  4 Oct 2024 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075176; cv=none; b=fk0pmPqeLUQDtE9y7K+F7mNemmVy9LK4DS7akHLI+L0IAuQOzzHBAeegz5guqydU4BLpO3S8IkbG5mnTJE6AcW9UXm3FQF6Sio4z7RhmYTZUdV+dDYUVzPK/sJegGioOSAjRkihZS2yIqp2oLFm5Y76Hbf2IQLWWN0TvXh8ddGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075176; c=relaxed/simple;
	bh=zAiuxacFGjjJJ4NBpmqER1HnPFYxoqexgWb58G2MWY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKQT+aM9dNWaNBm8bF4VRYO4g59dVTIcJbGXu2hOFI4W5jnCiuYhHvQ4+ggP/ITByX8K8UaQfZqhFXnJEc5OdCU37vuCd3zzvMQb+B50IR3u10ys74CdN/UraiYibBdGCIbdfojvwtnAvZ/otuMcHNXi7eO0BkzogGToK51/0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmenuaum; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7c3e1081804so1372477a12.3;
        Fri, 04 Oct 2024 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728075175; x=1728679975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GIk6uLjmdiootfCYWPE+h0kT4mdanO9y0QDF4fdw0A=;
        b=ZmenuaumpPHM/LiIN6k8+XSLA7iZgXwllGk6F/puGl6Z9i0d3tNefhnm0DY+lBw8dN
         6T9gy4VYmZXiCIcJnbAYvwwYHCqVSF3OrrcQPKk8IWRb59Wop7rser+cs2CySyJd4bZ0
         PQTy6U3l3H7aV50AFAvhQ542+lOgylWtf4O2IhF1snISQNh/PdZhMZS+QLRpL+tN5sSH
         w+2Go0UnHBUTi+GFvi9yDtYWguXFq4NrWESVX00COsC9gT2tX+tx0D/LY7rRVWYQ960z
         uLr7EEQ/mYEUCvaS8fdQc6smnxYxYZ1kGFRNFdbkmxjzEh4PLwuboojav8T2pDVJOCow
         YpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075175; x=1728679975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GIk6uLjmdiootfCYWPE+h0kT4mdanO9y0QDF4fdw0A=;
        b=GY3xaNS96Le7z7+Eux9UiSrWwUxSg4Qbg+galprTgR287fXS7D0wASiy/SI+a14/qJ
         aIoClHOWzv0t2B1rybhLFgj0CymtjOZEgibMsa6f1a3swiqRuhTkUtF+eR36P+85qVdz
         Hg0dbHp8z0kBnnR0qtxk232o5t5RGozA57hAye2U6kHSwxssdBg9bUbu7/p9ipg5obJE
         GGXl+6XqIOzWMe5ZrkLKpwC7sFZ3YeJc19+dU+Spfqbi6Vv4UznUDUeS7nWnS7TNWPcJ
         e/zFYk+52oQJJvzTZDVIjw+yTf6fV93JNyF9sCxSQ/wO2ZzH5HMKbYuSpLejcTs2zHst
         oo3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3OOusquHiEVe0VEeSU6KwkxohKji4TXAC7mGnynWQarH55u9yNZFRUHSwlrJUmf4HI+LX0BXIvUdx7OwQYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3N/wg0wwJ77i1DROJgv1vtkYxAsDYN34ftmlbXAJMqO0ftXmN
	MuPQSFAeXS8An+K4+TKuGSh87ePyBWh99EDwGOK7lrz499M0IJ/HKPuOrw==
X-Google-Smtp-Source: AGHT+IHv6nM5sqA1lFSijKAHK5xkR7d0A00qqSWVRTgj4XvJYns9Kqpdma1R+o/7fikcKY1bOnvhEg==
X-Received: by 2002:a05:6a20:9d94:b0:1d2:eaea:356c with SMTP id adf61e73a8af0-1d6dfaeddc9mr5575210637.41.1728075174554;
        Fri, 04 Oct 2024 13:52:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbd8b8sm300788b3a.1.2024.10.04.13.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 13:52:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Oct 2024 13:52:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] watchdog: always print when registering watchdog
 fails
Message-ID: <cff5410f-6b22-46c7-a7bb-53bf1988efb1@roeck-us.net>
References: <20241004200314.5459-1-wsa+renesas@sang-engineering.com>
 <20241004200314.5459-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004200314.5459-2-wsa+renesas@sang-engineering.com>

On Fri, Oct 04, 2024 at 10:03:04PM +0200, Wolfram Sang wrote:
> So far, only 'watchdog_register_device' prints an error if registering
> the watchdog driver fails. '__watchdog_register_device' doesn't.
> Refactor the code so that both print out. Drivers can then rely on that
> and skip their own error messages.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

