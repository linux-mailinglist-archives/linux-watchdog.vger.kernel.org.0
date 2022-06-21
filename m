Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC7055343A
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 16:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiFUOLw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 10:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiFUOLw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 10:11:52 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECC620BCA
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 07:11:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A395D1F8A3;
        Tue, 21 Jun 2022 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655820659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tk5k4sRLNjbp8727oQkqZfzM5jsX5rgTmhDY+LkVAs4=;
        b=IyoFydrJR5yF8Laf1PWvjn2049zV5jP/F9kA0HGWULEDKL4IzYoqAv4c1IObuD7io/5SDE
        m7AJqUypeSpKg5u2eXgQJ/4BWj2z0MTSGDDhBAIJTZiDloyhjz+8vYo9gqdQqC8R6WVgJY
        1arooDh/5/3UdxbUzhmj8U/WS60dS6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655820659;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tk5k4sRLNjbp8727oQkqZfzM5jsX5rgTmhDY+LkVAs4=;
        b=km8UCtILdrdrFYNvD1bvA85+dOwA06lMVt/17P6wtJgfYH1e+5vsekjtt5WhjVuX5K8lca
        X6DnAIbr5lwH8XBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AEC313638;
        Tue, 21 Jun 2022 14:10:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id PWBmHHPRsWIoRAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 21 Jun 2022 14:10:59 +0000
Date:   Tue, 21 Jun 2022 16:10:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Terry Bowman <terry.bowman@amd.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH] watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO
 resource
Message-ID: <20220621161057.75c9aa51@endymion.delvare>
In-Reply-To: <20220621140825.GA3437760@roeck-us.net>
References: <20220621152840.420a0f4c@endymion.delvare>
        <20220621140825.GA3437760@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 21 Jun 2022 07:08:25 -0700, Guenter Roeck wrote:
> On Tue, Jun 21, 2022 at 03:28:40PM +0200, Jean Delvare wrote:
> > Unlike release_mem_region(), a call to release_resource() does not
> > free the resource, so it has to be freed explicitly to avoid a memory
> > leak.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Fixes: 0578fff4aae5 ("Watchdog: sp5100_tco: Add initialization using EFCH MMIO")
> > Cc: Terry Bowman <terry.bowman@amd.com>
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>  
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks.

> Unless I am missing something, it looks like every caller of
> request_mem_region_muxed() has that problem.

You are correct. Fixes have been sent for review already.

-- 
Jean Delvare
SUSE L3 Support
