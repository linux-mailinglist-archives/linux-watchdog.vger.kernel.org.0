Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB1F72D815
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Jun 2023 05:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239519AbjFMDSD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Jun 2023 23:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239475AbjFMDRX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Jun 2023 23:17:23 -0400
X-Greylist: delayed 3861 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 20:16:31 PDT
Received: from servidor.delcampo.net.ni (servidor.delcampo.net.ni [165.98.97.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1525A2110
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Jun 2023 20:16:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by servidor.delcampo.net.ni (Postfix) with ESMTP id 7C340E8CDA2;
        Mon, 12 Jun 2023 19:48:42 -0600 (CST)
Received: from servidor.delcampo.net.ni ([127.0.0.1])
        by localhost (servidor.delcampo.net.ni [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Wjc80frjsR7U; Mon, 12 Jun 2023 19:48:37 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by servidor.delcampo.net.ni (Postfix) with ESMTP id EEC9CE8BDEC;
        Mon, 12 Jun 2023 19:32:00 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 servidor.delcampo.net.ni EEC9CE8BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=delcampo.net.ni;
        s=mdc; t=1686619921;
        bh=6U02rciR9yO0dqW4aRlstxCgOSivJk6a64yGEbcYLnk=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=VecNhlkAhjmRSOyxji2P7WzLwwlDj64ioyUCwmYjwODdzWHJ7v5K2tmZDm/BaYG/7
         5ek3SKAj9UvQyg9eV6FsVAuhqY4R/OUHottU1g74IFk+DXXerJFRz7+hZVZim3XJjp
         0G/3X8FTnRU/TlOQn9kFcx52N/HDCj+6gSy2Wogw=
X-Virus-Scanned: amavisd-new at delcampo.net.ni
Received: from servidor.delcampo.net.ni ([127.0.0.1])
        by localhost (servidor.delcampo.net.ni [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id K9ei0NUF0gGh; Mon, 12 Jun 2023 19:32:00 -0600 (CST)
Received: from [10.2.18.169] (unknown [95.181.237.4])
        by servidor.delcampo.net.ni (Postfix) with ESMTPSA id 5C2CBE8BD6C;
        Mon, 12 Jun 2023 19:15:25 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Loan Offer
To:     Recipients <contabilidad01@delcampo.net.ni>
From:   "Tom Nunez" <contabilidad01@delcampo.net.ni>
Date:   Tue, 13 Jun 2023 02:12:25 +0100
Reply-To: jessepeterson@skiff.com
Message-Id: <20230613011525.5C2CBE8BD6C@servidor.delcampo.net.ni>
X-DelCampo-MailScanner: Found to be clean, Found to be clean
X-DelCampo-MailScanner-SpamCheck: no es spam, SpamAssassin (almacenado,
        puntaje=-1.11, requerido 4, autolearn=not spam, ALL_TRUSTED -1.00,
        DKIM_SIGNED 0.10, DKIM_VALID -0.10, DKIM_VALID_AU -0.10,
        T_SCC_BODY_TEXT_LINE -0.01), no es spam, SpamAssassin (almacenado,
        puntaje=-1.11, requerido 4, autolearn=not spam, ALL_TRUSTED -1.00,
        DKIM_SIGNED 0.10, DKIM_VALID -0.10, DKIM_VALID_AU -0.10,
        T_SCC_BODY_TEXT_LINE -0.01)
X-DelCampo-MailScanner-Information: Please contact the ISP for more information
X-DelCampo-MailScanner-ID: EEC9CE8BDEC.A7EE3
X-DelCampo-MailScanner-From: contabilidad01@delcampo.net.ni
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_BL,
        RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

We offer loans to individuals and firms at low interest rates of 2%. We giv=
e out loan for Debt Consolidation,Home Improvements, Car Purchase,A New Hom=
e,Investment/Business Expansion Purposes or vacation.

In our loan scheme both local and international clients have the guarantee =
of obtaining a loan from us on the mode of unsecured offshore international=
 funding which means no collateral is required for this process.

Contact us for more inquiries or reply to this email for more information.

Regards,
Jesse Peterson
