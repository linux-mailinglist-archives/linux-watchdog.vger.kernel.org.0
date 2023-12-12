Return-Path: <linux-watchdog+bounces-282-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C680F4B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 18:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0CF51C20CDA
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Dec 2023 17:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2987D8A4;
	Tue, 12 Dec 2023 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QURQxj2l"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868C2F2;
	Tue, 12 Dec 2023 09:35:32 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b8b8372e30so4411832b6e.3;
        Tue, 12 Dec 2023 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702402532; x=1703007332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cnCE4eZTCp1HU5JdCsK/r3isEA7RhHAqdg7HGGt07U=;
        b=QURQxj2lJRFiVM4mcuZzyeFVjaCr2asVuZIFimUeD7j9FVwaJrLbjQa+KAWJeZGn3S
         aZ5RiGpmNFdB8AmfCEhZUNVYamh7Cfna4yvv/c4dWvj2uEfSZKjJLzr/hQNgmTuj45lb
         A/RDcAinpk7eHGpuaH/LtAj5ArR0DGlDeX+iZT1QSenb4RmZeaAG1MscDKRqsUuTZjU/
         DE69xowmFZ/EHeLVmtWzO6SRgLN0AmhMWn0UC8dpWOe+1YPvun/fjzIFgOV3oiNg31Sk
         HhezAQdLroifJgucJPwM4gq6X98YHIX3EoU1QcB13XzUS/o/UztlnSptqDpeTT8HQKfF
         FXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702402532; x=1703007332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cnCE4eZTCp1HU5JdCsK/r3isEA7RhHAqdg7HGGt07U=;
        b=IC/KHxazEd0Spp65+Aa5r25Lh9ivyD9mU3qjwxZJ4bOvznGZrc5tq/zEPxlFj6cV4y
         YxXFscldJ9ffbd6ev/ANA2Mz8z2wcCq5eGZ7aRPIZ3Eea9BS2Qjbp1/h4pnOur2v/wqt
         vtQ7H+Z3galA4ksn33glDuEUJzm3z8ebNKXjgrTR6HNiAX+sOixDMi02kfv5aKLH+Wxl
         BOrKSnalG6MQKjzMfqz9Wy3/1UljJ0mGgzQcd72pWXfdPkPyVli5y0uEAWifgWPQgoDZ
         RDcoUed3PJGh1O8rPZpr/EFBJ2IvY6aaOz2SeYVcgoHnHVBdYQUetv6y1NRXUNngBkyg
         t7hQ==
X-Gm-Message-State: AOJu0Yx/cfdasfjUthKWo6blII3RFmbH7RhfPkkfZnb7nV33SDWdFzK2
	zA6lSg0CC3QGukVmYMvglrU=
X-Google-Smtp-Source: AGHT+IE+JQWE0v9l/smlMzjjlWZ56OqSxZ4vKVhpZVx6bxi4t6plALmUDdDjfYEvt6h4wHnl1LuJGQ==
X-Received: by 2002:a05:6808:640f:b0:3ab:8295:f2f1 with SMTP id fg15-20020a056808640f00b003ab8295f2f1mr7517066oib.45.1702402531555;
        Tue, 12 Dec 2023 09:35:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5-20020a544805000000b003af644e6e81sm2457885oij.45.2023.12.12.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 09:35:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Dec 2023 09:35:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3.1 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Message-ID: <a7c12265-e1f0-4b84-8486-366ae21743ae@roeck-us.net>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
 <a16592d3-e924-435c-bfb0-2b0f2b3cf0a9@roeck-us.net>
 <20231212-impending-delay-3af2dca43d35@spud>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-impending-delay-3af2dca43d35@spud>

On Tue, Dec 12, 2023 at 05:08:45PM +0000, Conor Dooley wrote:
> On Tue, Dec 12, 2023 at 08:56:00AM -0800, Guenter Roeck wrote:
> > On Mon, Dec 04, 2023 at 05:25:04PM +0000, Biju Das wrote:
> > > The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> > > are required. The fallback compatible string "dlg,da9062-watchdog" will be
> > > used on DA9061 watchdog.
> > > 
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> There's a v5 of this series already FYI

Yes, I noticed too late. Sorry. Happens if one is way backlogged
with reviews.

Guenter

